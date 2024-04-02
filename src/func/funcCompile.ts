import { TactLogger } from "../logger";
import { errorToString } from "../utils/errorToString";

// Wasm Imports
// eslint-disable-next-line @typescript-eslint/no-var-requires
const CompilerModule = require("./funcfiftlib.js");
// eslint-disable-next-line @typescript-eslint/no-var-requires
const FuncFiftLibWasm = require("./funcfiftlib.wasm.js").FuncFiftLibWasm;
const WasmBinary = Buffer.from(FuncFiftLibWasm, "base64");

type Pointer = unknown;
// eslint-disable-next-line @typescript-eslint/no-explicit-any
const writeToCString = (mod: any, data: string): Pointer => {
    const len = mod.lengthBytesUTF8(data) + 1;
    const ptr = mod._malloc(len);
    mod.stringToUTF8(data, ptr, len);
    return ptr;
};
// eslint-disable-next-line @typescript-eslint/no-explicit-any
const writeToCStringPtr = (mod: any, str: string, ptr: any) => {
    const allocated = writeToCString(mod, str);
    mod.setValue(ptr, allocated, "*");
    return allocated;
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const readFromCString = (mod: any, pointer: Pointer): string =>
    mod.UTF8ToString(pointer);

export function cutFirstLine(src: string) {
    return src.slice(src.indexOf("\n") + 1);
}

export type FuncCompilationResult =
    | {
          ok: false;
          log: string;
          fift: string | null;
          output: Buffer | null;
      }
    | {
          ok: true;
          log: string;
          fift: string;
          output: Buffer;
      };

type CompileResult =
    | {
          status: "error";
          message: string;
      }
    | {
          status: "ok";
          codeBoc: string;
          fiftCode: string;
          warnings: string;
      };

export async function funcCompile(args: {
    entries: string[];
    sources: { path: string; content: string }[];
    logger: TactLogger;
}): Promise<FuncCompilationResult> {
    // Parameters
    const files: string[] = args.entries;
    const configStr = JSON.stringify({
        sources: files,
        optLevel: 2, // compileConfig.optLevel || 2
    });

    // Pointer tracking
    const allocatedPointers: Pointer[] = [];
    const allocatedFunctions: Pointer[] = [];
    const trackPointer = (pointer: Pointer): Pointer => {
        allocatedPointers.push(pointer);
        return pointer;
    };
    const trackFunctionPointer = (pointer: Pointer): Pointer => {
        allocatedFunctions.push(pointer);
        return pointer;
    };

    // Create module
    const logs: string[] = [];
    const mod = await CompilerModule({
        wasmBinary: WasmBinary,
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        printErr: (e: any) => {
            logs.push(e);
        },
    });

    // Execute
    try {
        // Write config
        const configPointer = trackPointer(writeToCString(mod, configStr));

        // FS emulation callback
        const callbackPtr = trackFunctionPointer(
            mod.addFunction(
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                (_kind: any, _data: any, contents: any, error: any) => {
                    const kind: string = readFromCString(mod, _kind);
                    const data: string = readFromCString(mod, _data);
                    if (kind === "realpath") {
                        allocatedPointers.push(
                            writeToCStringPtr(mod, data, contents),
                        );
                    } else if (kind === "source") {
                        try {
                            const fl = args.sources.find(
                                (v) => v.path === data,
                            );
                            if (!fl) {
                                throw Error("File not found: " + data);
                            }
                            allocatedPointers.push(
                                writeToCStringPtr(mod, fl.content, contents),
                            );
                        } catch (err) {
                            // eslint-disable-next-line @typescript-eslint/no-explicit-any
                            const e = err as any;
                            allocatedPointers.push(
                                writeToCStringPtr(
                                    mod,
                                    "message" in e ? e.message : e.toString(),
                                    error,
                                ),
                            );
                        }
                    } else {
                        allocatedPointers.push(
                            writeToCStringPtr(
                                mod,
                                "Unknown callback kind " + kind,
                                error,
                            ),
                        );
                    }
                },
                "viiii",
            ),
        );

        // Execute
        const resultPointer = trackPointer(
            mod._func_compile(configPointer, callbackPtr),
        );
        const retJson = readFromCString(mod, resultPointer);
        const result = JSON.parse(retJson) as CompileResult;

        const msg = logs.join("\n");

        if (result.status === "error") {
            return {
                ok: false,
                log:
                    logs.length > 0
                        ? msg
                        : result.message
                          ? result.message
                          : "Unknown error",
                fift: null,
                output: null,
            };
        } else if (result.status === "ok") {
            return {
                ok: true,
                log:
                    logs.length > 0
                        ? msg
                        : result.warnings
                          ? result.warnings
                          : "",
                fift: cutFirstLine(result.fiftCode.replaceAll("\\n", "\n")),
                output: Buffer.from(result.codeBoc, "base64"),
            };
        } else {
            throw Error("Unexpected compiler response");
        }
    } catch (e) {
        args.logger.error(errorToString(e));
        throw Error("Unexpected compiler response");
    } finally {
        for (const i of allocatedFunctions) {
            mod.removeFunction(i);
        }
        for (const i of allocatedPointers) {
            mod._free(i);
        }
    }
}
