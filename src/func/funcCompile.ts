import { TactLogger } from "../logger";
import { errorToString } from "../utils/errorToString";

// Wasm Imports
const CompilerModule = require('./funcfiftlib.js');
const FuncFiftLibWasm = require('./funcfiftlib.wasm.js').FuncFiftLibWasm;
const WasmBinary = Buffer.from(FuncFiftLibWasm, 'base64');

type Pointer = unknown;
const writeToCString = (mod: any, data: string): Pointer => {
    const len = mod.lengthBytesUTF8(data) + 1;
    const ptr = mod._malloc(len);
    mod.stringToUTF8(data, ptr, len);
    return ptr;
};
const writeToCStringPtr = (mod: any, str: string, ptr: any) => {
    const allocated = writeToCString(mod, str);
    mod.setValue(ptr, allocated, '*');
    return allocated;
};

const readFromCString = (mod: any, pointer: Pointer): string => mod.UTF8ToString(pointer);

export function cutFirstLine(src: string) {
    return src.slice(src.indexOf('\n') + 1);
}

export type FuncCompilationResult = {
    ok: false,
    log: string,
    fift: string | null,
    output: Buffer | null
} | {
    ok: true,
    log: string,
    fift: string,
    output: Buffer
}

type CompileResult = {
    status: "error",
    message: string
} | {
    status: "ok",
    codeBoc: string,
    fiftCode: string,
    warnings: string
};

export async function funcCompile(args: { entries: string[], sources: { path: string, content: string }[], logger: TactLogger }): Promise<FuncCompilationResult> {

    // Parameters
    let files: string[] = args.entries;
    let configStr = JSON.stringify({
        sources: files,
        optLevel: 2 // compileConfig.optLevel || 2
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
    let logs: string[] = []
    let mod = await CompilerModule({ wasmBinary: WasmBinary, printErr: (e: any) => { logs.push(e); } });

    // Execute
    try {

        // Write config
        let configPointer = trackPointer(writeToCString(mod, configStr));

        // FS emulation callback
        const callbackPtr = trackFunctionPointer(mod.addFunction((_kind: any, _data: any, contents: any, error: any) => {
            const kind: string = readFromCString(mod, _kind);
            const data: string = readFromCString(mod, _data);
            if (kind === 'realpath') {
                allocatedPointers.push(writeToCStringPtr(mod, data, contents));
            } else if (kind === 'source') {
                try {
                    let fl = args.sources.find((v) => v.path === data);
                    if (!fl) {
                        throw Error('File not found: ' + data)
                    }
                    allocatedPointers.push(writeToCStringPtr(mod, fl.content, contents));
                } catch (err) {
                    const e = err as any;
                    allocatedPointers.push(writeToCStringPtr(mod, 'message' in e ? e.message : e.toString(), error));
                }
            } else {
                allocatedPointers.push(writeToCStringPtr(mod, 'Unknown callback kind ' + kind, error));
            }
        }, 'viiii'));

        // Execute
        let resultPointer = trackPointer(mod._func_compile(configPointer, callbackPtr));
        let retJson = readFromCString(mod, resultPointer);
        let result = JSON.parse(retJson) as CompileResult;

        let msg = logs.join('\n');

        if (result.status === 'error') {
            return {
                ok: false,
                log: logs.length > 0 ? msg : (result.message ? result.message : 'Unknown error'),
                fift: null,
                output: null
            };
        } else if (result.status === 'ok') {
            return {
                ok: true,
                log: logs.length > 0 ? msg : (result.warnings ? result.warnings : ''),
                fift: cutFirstLine(result.fiftCode.replaceAll('\\n', '\n')),
                output: Buffer.from(result.codeBoc, 'base64')
            };
        } else {
            throw Error('Unexpected compiler response');
        }
    } catch (e) {
        args.logger.error(errorToString(e));
        throw Error('Unexpected compiler response');
    } finally {
        for (let i of allocatedFunctions) {
            mod.removeFunction(i);
        }
        for (let i of allocatedPointers) {
            mod._free(i);
        }
    }
}