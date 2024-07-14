import { CompilerContext } from "../context";
import { FuncAstFunction } from "../func/syntax";

/**
 * The context containing the objects generated from the bottom-up in the generation
 * process and other intermediate information.
 */
export class CodegenContext {
    public ctx: CompilerContext;

    /** Generated struct constructors. */
    public constructors: FuncAstFunction[] = [];

    constructor(ctx: CompilerContext) {
        this.ctx = ctx;
    }
}
