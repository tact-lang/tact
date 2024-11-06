import { CompilerContext } from "../context";
import { simplify_expressions } from "./expr_simplification";

export function optimize_tact(ctx: CompilerContext): CompilerContext {
    
    // Call the expression simplification phase
    ctx = simplify_expressions(ctx);

    // Here, we will call the constant propagation analyzer

    return ctx;
}