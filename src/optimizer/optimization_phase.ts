import { CompilerContext } from "../context";
import { prettyPrint } from "../prettyPrinter";
import {
    getAllStaticConstants,
    getAllStaticFunctions,
    getAllTypes,
} from "../types/resolveDescriptors";
import { simplify_expressions } from "./expr_simplification";
import { writeFileSync } from "fs";

export function optimize_tact(ctx: CompilerContext): CompilerContext {
    // Call the expression simplification phase
    ctx = simplify_expressions(ctx);

    // Here, we will call the constant propagation analyzer

    return ctx;
}

export function dump_tact_code(ctx: CompilerContext, file: string) {
    let program = "";

    for (const c of getAllStaticConstants(ctx)) {
        program += `${prettyPrint(c.ast)}\n`;
    }

    program += "\n";

    for (const f of getAllStaticFunctions(ctx)) {
        program += `${prettyPrint(f.ast)}\n\n`;
    }

    for (const t of getAllTypes(ctx)) {
        program += `${prettyPrint(t.ast)}\n\n`;
    }

    writeFileSync(file, program, {
        flag: "w",
    });
}
