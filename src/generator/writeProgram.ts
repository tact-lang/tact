import { CompilerContext } from "../context";
import { getAllocation, getSortedTypes } from "../storage/resolveAllocation";
import {
    getAllStaticFunctions,
    getAllTypes,
    toBounced,
} from "../types/resolveDescriptors";
import { WriterContext, WrittenFunction } from "./Writer";
import {
    writeBouncedParser,
    writeOptionalParser,
    writeOptionalSerializer,
    writeParser,
    writeSerializer,
} from "./writers/writeSerialization";
import { writeStdlib } from "./writers/writeStdlib";
import { writeAccessors } from "./writers/writeAccessors";
import { ContractABI } from "@ton/core";
import { writeFunction } from "./writers/writeFunction";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";
import { getRawAST } from "../grammar/store";
import { emit } from "./emitter/emit";
import {
    writeInit,
    writeMainContract,
    writeStorageOps,
} from "./writers/writeContract";
import { initId } from "./writers/id";
import { idToHex } from "../utils/idToHex";
import { trimIndent } from "../utils/text";

export async function writeProgram(
    ctx: CompilerContext,
    abiSrc: ContractABI,
    basename: string,
    debug: boolean = false,
) {
    //
    // Load ABI (required for generator)
    //

    const abi = JSON.stringify(abiSrc);
    const abiLink = await calculateIPFSlink(Buffer.from(abi));

    //
    // Render contract
    //

    const wCtx = new WriterContext(ctx, abiSrc.name!);
    writeAll(ctx, wCtx, abiSrc.name!, abiLink);
    const functions = wCtx.extract(debug);

    //
    // Emit files
    //

    const files: { name: string; code: string }[] = [];
    const imported: string[] = [];

    //
    // Headers
    //

    const headers: string[] = [];
    headers.push(`;;`);
    headers.push(`;; Header files for ${abiSrc.name}`);
    headers.push(`;; NOTE: declarations are sorted for optimal order`);
    headers.push(`;;`);
    headers.push(``);
    // const sortedHeaders = [...functions].sort((a, b) => a.name.localeCompare(b.name));
    for (const f of functions) {
        if (f.code.kind === "generic" && f.signature) {
            headers.push(`;; ${f.name}`);
            let sig = f.signature;
            if (f.flags.has("impure")) {
                sig = sig + " impure";
            }
            if (f.flags.has("inline")) {
                sig = sig + " inline";
            } else {
                sig = sig + " inline_ref";
            }
            headers.push(sig + ";");
            headers.push("");
        }
    }
    files.push({
        name: basename + ".headers.fc",
        code: headers.join("\n"),
    });

    //
    // stdlib
    //

    const stdlibHeader = trimIndent(`
        global (int, slice, int, slice) __tact_context;
        global slice __tact_context_sender;
        global cell __tact_context_sys;
        global int __tact_randomized;
    `);

    const stdlibFunctions = tryExtractModule(functions, "stdlib", []);
    if (stdlibFunctions) {
        imported.push("stdlib");
    }

    const stdlib = emit({
        header: stdlibHeader,
        functions: stdlibFunctions,
    });

    files.push({
        name: basename + ".stdlib.fc",
        code: stdlib,
    });

    //
    // native
    //

    const nativeSources = getRawAST(ctx).funcSources;
    if (nativeSources.length > 0) {
        imported.push("native");
        files.push({
            name: basename + ".native.fc",
            code: emit({
                header: [...nativeSources.map((v) => v.code)].join("\n\n"),
            }),
        });
    }

    //
    // constants
    //

    const constantsFunctions = tryExtractModule(
        functions,
        "constants",
        imported,
    );
    if (constantsFunctions) {
        imported.push("constants");
        files.push({
            name: basename + ".constants.fc",
            code: emit({ functions: constantsFunctions }),
        });
    }

    //
    // storage
    //

    const emittedTypes: string[] = [];
    const types = getSortedTypes(ctx);
    for (const t of types) {
        const ffs: WrittenFunction[] = [];
        if (t.kind === "struct" || t.kind === "contract" || t.kind == "trait") {
            const typeFunctions = tryExtractModule(
                functions,
                "type:" + t.name,
                imported,
            );
            if (typeFunctions) {
                imported.push("type:" + t.name);
                ffs.push(...typeFunctions);
            }
        }
        if (t.kind === "contract") {
            const typeFunctions = tryExtractModule(
                functions,
                "type:" + t.name + "$init",
                imported,
            );
            if (typeFunctions) {
                imported.push("type:" + t.name + "$init");
                ffs.push(...typeFunctions);
            }
        }
        if (ffs.length > 0) {
            const header: string[] = [];
            header.push(";;");
            header.push(`;; Type: ${t.name}`);
            if (t.header !== null) {
                header.push(`;; Header: 0x${idToHex(t.header)}`);
            }
            if (t.tlb) {
                header.push(`;; TLB: ${t.tlb}`);
            }
            header.push(";;");

            emittedTypes.push(
                emit({
                    functions: ffs,
                    header: header.join("\n"),
                }),
            );
        }
    }
    if (emittedTypes.length > 0) {
        files.push({
            name: basename + ".storage.fc",
            code: [...emittedTypes].join("\n\n"),
        });
    }

    // const storageFunctions = tryExtractModule(functions, 'storage', imported);
    // if (storageFunctions) {
    //     imported.push('storage');
    //     files.push({
    //         name: basename + '.storage.fc',
    //         code: emit({ functions: storageFunctions })
    //     });
    // }

    //
    // Remaining
    //

    const remainingFunctions = tryExtractModule(functions, null, imported);
    const header: string[] = [];
    header.push("#pragma version =0.4.4;");
    header.push("#pragma allow-post-modification;");
    header.push("#pragma compute-asm-ltr;");
    header.push("");
    for (const i of files.map((v) => `#include "${v.name}";`)) {
        header.push(i);
    }
    header.push("");
    header.push(";;");
    header.push(`;; Contract ${abiSrc.name} functions`);
    header.push(";;");
    header.push("");
    const code = emit({
        header: header.join("\n"),
        functions: remainingFunctions,
    });
    files.push({
        name: basename + ".code.fc",
        code,
    });

    return {
        entrypoint: basename + ".code.fc",
        files,
        abi,
    };
}

function tryExtractModule(
    functions: WrittenFunction[],
    context: string | null,
    imported: string[],
): WrittenFunction[] | null {
    // Put to map
    const maps = new Map<string, WrittenFunction>();
    for (const f of functions) {
        maps.set(f.name, f);
    }

    // Extract functions of a context
    const ctxFunctions: WrittenFunction[] = functions
        .filter((v) => v.code.kind !== "skip")
        .filter((v) => {
            if (context) {
                return v.context === context;
            } else {
                return v.context === null || !imported.includes(v.context);
            }
        });
    if (ctxFunctions.length === 0) {
        return null;
    }

    // Check dependencies
    // if (context) {
    //     for (let f of ctxFunctions) {
    //         for (let d of f.depends) {
    //             let c = maps.get(d)!.context;
    //             if (!c) {
    //                 console.warn(`Function ${f.name} depends on ${d} with generic context, but ${context} is needed`);
    //                 return null; // Found dependency to unknown function
    //             }
    //             if (c !== context && (c !== null && !imported.includes(c))) {
    //                 console.warn(`Function ${f.name} depends on ${d} with ${c} context, but ${context} is needed`);
    //                 return null; // Found dependency to another context
    //             }
    //         }
    //     }
    // }

    return ctxFunctions;
}

function writeAll(
    ctx: CompilerContext,
    wCtx: WriterContext,
    name: string,
    abiLink: string,
) {
    // Load all types
    const allTypes = Object.values(getAllTypes(ctx));
    const contracts = allTypes.filter((v) => v.kind === "contract");
    const c = contracts.find((v) => v.name === name);
    if (!c) {
        throw Error(`Contract "${name}" not found`);
    }

    // Stdlib
    writeStdlib(wCtx);

    // Serializers
    const sortedTypes = getSortedTypes(ctx);
    for (const t of sortedTypes) {
        if (t.kind === "contract" || t.kind === "struct") {
            const allocation = getAllocation(ctx, t.name);
            const allocationBounced = getAllocation(ctx, toBounced(t.name));
            writeSerializer(
                t.name,
                t.kind === "contract",
                allocation,
                t.origin,
                wCtx,
            );
            writeOptionalSerializer(t.name, t.origin, wCtx);
            writeParser(
                t.name,
                t.kind === "contract",
                allocation,
                t.origin,
                wCtx,
            );
            writeOptionalParser(t.name, t.origin, wCtx);
            writeBouncedParser(
                t.name,
                t.kind === "contract",
                allocationBounced,
                t.origin,
                wCtx,
            );
        }
    }

    // Accessors
    for (const t of allTypes) {
        if (t.kind === "contract" || t.kind === "struct") {
            writeAccessors(t, t.origin, wCtx);
        }
    }

    // Init serializers
    for (const t of sortedTypes) {
        if (t.kind === "contract" && t.init) {
            const allocation = getAllocation(ctx, initId(t.name));
            writeSerializer(initId(t.name), true, allocation, t.origin, wCtx);
            writeParser(initId(t.name), false, allocation, t.origin, wCtx);
        }
    }

    // Storage Functions
    for (const t of sortedTypes) {
        if (t.kind === "contract") {
            writeStorageOps(t, t.origin, wCtx);
        }
    }

    // Static functions
    const sf = getAllStaticFunctions(ctx);
    for (const k in sf) {
        const f = sf[k];
        writeFunction(f, wCtx);
    }

    // Extensions
    for (const c of allTypes) {
        if (c.kind !== "contract" && c.kind !== "trait") {
            // We are rendering contract functions separately
            for (const f of c.functions.values()) {
                writeFunction(f, wCtx);
            }
        }
    }

    // Contract functions
    for (const c of contracts) {
        // Init
        if (c.init) {
            writeInit(c, c.init, wCtx);
        }

        // Functions
        for (const f of c.functions.values()) {
            writeFunction(f, wCtx);
        }
    }

    // Write contract main
    writeMainContract(c, abiLink, wCtx);
}
