import { CompilerContext } from "../context";
import { getAllocation, getSortedTypes } from "../storage/resolveAllocation";
import { getAllStaticFunctions, getAllTypes } from "../types/resolveDescriptors";
import { WriterContext, WrittenFunction } from "./Writer";
import { writeOptionalParser, writeOptionalSerializer, writeParser, writeSerializer } from "./writers/writeSerialization";
import { writeStdlib } from "./writers/writeStdlib";
import { writeAccessors } from "./writers/writeAccessors";
import { ContractABI } from "ton-core";
import { writeFunction } from "./writers/writeFunction";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";
import { getAllStrings } from "../types/resolveStrings";
import { writeString } from './writers/writeConstant';
import { getRawAST } from "../grammar/store";
import { emit } from "./emitter/emit";
import { writeInit, writeMainContract, writeStorageOps } from "./writers/writeContract";
import { initId } from "./writers/id";
import { writeReceiver } from "./writers/writeRouter";


export async function writeProgram(ctx: CompilerContext, abiSrc: ContractABI, basename: string, debug: boolean = false) {

    //
    // Load ABI (required for generator)
    //

    let abi = JSON.stringify(abiSrc);
    let abiLink = await calculateIPFSlink(Buffer.from(abi));

    //
    // Render contract
    //

    const wctx = new WriterContext(ctx);
    writeAll(ctx, wctx, abiSrc.name!, abiLink);
    const functions = wctx.extract(debug);

    //
    // Emit files
    //

    const files: { name: string, code: string }[] = [];
    const imported: string[] = [];

    //
    // stdlib
    //

    const stdlibHeader = `
        #pragma version =0.4.2;
        #pragma allow-post-modification;
        #pragma compute-asm-ltr;

        global (int, slice, int, slice) __tact_context;
        global slice __tact_context_sender;
        global cell __tact_context_sys;
        global int __tact_randomized;
    `;

    const stdlibFunctions = tryExtractModule(functions, 'stdlib', []);
    if (stdlibFunctions) {
        imported.push('stdlib');
    }

    let stdlib = emit({
        header: stdlibHeader,
        functions: stdlibFunctions
    });

    files.push({
        name: basename + '.stdlib.fc',
        code: stdlib
    });

    //
    // native
    //

    let nativeSources = getRawAST(ctx).funcSources;
    if (nativeSources.length > 0) {
        imported.push('native');
        files.push({
            name: basename + '.native.fc',
            code: emit({ header: nativeSources.map((v) => v.code).join('\n\n') })
        });
    }

    // 
    // constants
    //

    const constantsFunctions = tryExtractModule(functions, 'constants', imported);
    if (constantsFunctions) {
        imported.push('constants');
        files.push({
            name: basename + '.constants.fc',
            code: emit({ functions: constantsFunctions })
        });
    }

    // 
    // storage
    //

    const storageFunctions = tryExtractModule(functions, 'storage', imported);
    if (storageFunctions) {
        imported.push('storage');
        files.push({
            name: basename + '.storage.fc',
            code: emit({ functions: storageFunctions })
        });
    }

    //
    // Remaining
    // 

    const remainingFunctions = tryExtractModule(functions, null, imported);
    const code = emit({
        header: imported.map((v) => `#include "${basename}.${v}.fc";`).join('\n'),
        functions: remainingFunctions
    });
    files.push({
        name: basename + '.code.fc',
        code
    });

    return {
        files, abi
    };
}

function tryExtractModule(functions: WrittenFunction[], context: string | null, imported: string[]): WrittenFunction[] | null {

    // Put to map
    let maps = new Map<string, WrittenFunction>();
    for (let f of functions) {
        maps.set(f.name, f);
    }

    // Extract functions of a context
    let ctxFunctions: WrittenFunction[] = functions
        .filter((v) => v.code.kind !== 'skip')
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
    if (context) {
        for (let f of ctxFunctions) {
            for (let d of f.depends) {
                let c = maps.get(d)!.context;
                if (!c) {
                    console.warn(`Function ${f.name} depends on ${d} with generic context, but ${context} is needed`);
                    return null; // Found dependency to unknown function
                }
                if (c !== context && (c !== null && !imported.includes(c))) {
                    console.warn(`Function ${f.name} depends on ${d} with ${context} context, but ${context} is needed`);
                    return null; // Found dependency to another context
                }
            }
        }
    }

    return ctxFunctions;
}

function writeAll(ctx: CompilerContext, wctx: WriterContext, name: string, abiLink: string) {

    // Load all types
    const allTypes = Object.values(getAllTypes(ctx));
    const contracts = allTypes.filter((v) => v.kind === 'contract');
    const c = contracts.find((v) => v.name === name);
    if (!c) {
        throw Error(`Contract ${name} not found`);
    }

    // Stdlib
    writeStdlib(wctx);

    // Serializators
    let sortedTypes = getSortedTypes(ctx);
    for (let t of sortedTypes) {
        if (t.kind === 'contract' || t.kind === 'struct') {
            let allocation = getAllocation(ctx, t.name);
            writeSerializer(t.name, t.kind === 'contract', allocation, t.origin, wctx);
            writeOptionalSerializer(t.name, t.origin, wctx);
            writeParser(t.name, t.kind === 'contract', allocation, t.origin, wctx);
            writeOptionalParser(t.name, t.origin, wctx);
        }
    }

    // Accessors
    for (let t of allTypes) {
        if (t.kind === 'contract' || t.kind === 'struct') {
            writeAccessors(t, t.origin, wctx);
        }
    }

    // Init serializers
    for (let t of sortedTypes) {
        if (t.kind === 'contract' && t.init) {
            let allocation = getAllocation(ctx, initId(t.name));
            writeSerializer(initId(t.name), true, allocation, t.origin, wctx);
            writeParser(initId(t.name), false, allocation, t.origin, wctx);
        }
    }

    // Storage Functions
    for (let t of sortedTypes) {
        if (t.kind === 'contract') {
            writeStorageOps(t, t.origin, wctx);
        }
    }

    // Strings
    for (let k of getAllStrings(ctx)) {
        writeString(k.value, wctx);
    }

    // Static functions
    let sf = getAllStaticFunctions(ctx);
    for (let k in sf) {
        let f = sf[k];
        writeFunction(f, wctx);
    }

    // Extensions
    for (let c of allTypes) {
        if (c.kind !== 'contract' && c.kind !== 'trait') { // We are rendering contract functions separately
            for (let f of c.functions.values()) {
                writeFunction(f, wctx);
            }
        }
    }

    // Contract functions
    for (let c of contracts) {

        // Init
        if (c.init) {
            writeInit(c, c.init, wctx);
        }

        // Functions
        for (let f of c.functions.values()) {
            writeFunction(f, wctx);
        }
    }

    // Write contract main
    writeMainContract(c, abiLink, wctx);
}
