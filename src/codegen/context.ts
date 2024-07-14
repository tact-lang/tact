import { CompilerContext } from "../context";
import { FuncAstFunction } from "../func/syntax";

type ContextValues = {
    constructor: FuncAstFunction;
};

export type ContextValueKind = keyof ContextValues;

/**
 * The context containing the objects generated from the bottom-up in the generation
 * process and other intermediate information.
 */
export class CodegenContext {
    public ctx: CompilerContext;

    /** Generated struct constructors. */
    private constructors: FuncAstFunction[] = [];

    constructor(ctx: CompilerContext) {
        this.ctx = ctx;
    }

    public add<K extends ContextValueKind>(
        kind: K,
        value: ContextValues[K],
    ): void {
        switch (kind) {
            case "constructor":
                this.constructors.push(value as FuncAstFunction);
                break;
        }
    }
}
