import { CompilerContext } from "../context";
import { FuncAstFunctionDefinition } from "../func/syntax";

type ContextValues = {
    constructor: FuncAstFunctionDefinition;
};

export type ContextValueKind = keyof ContextValues;

/**
 * The context containing the objects generated from the bottom-up in the generation
 * process and other intermediate information.
 */
export class CodegenContext {
    public ctx: CompilerContext;

    /** Generated struct constructors. */
    private constructors: FuncAstFunctionDefinition[] = [];

    constructor(ctx: CompilerContext) {
        this.ctx = ctx;
    }

    public add<K extends ContextValueKind>(
        kind: K,
        value: ContextValues[K],
    ): void {
        switch (kind) {
            case "constructor":
                this.constructors.push(value as FuncAstFunctionDefinition);
                break;
        }
    }

    /**
     * Returns all the generated functions.
     */
    public getFunctions(): FuncAstFunctionDefinition[] {
        return this.constructors;
    }
}
