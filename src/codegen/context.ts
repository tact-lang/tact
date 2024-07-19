import { CompilerContext } from "../context";
import { FuncAstFunctionDefinition, FuncAstAsmFunction } from "../func/syntax";

type ContextValues = {
    function: FuncAstFunctionDefinition | FuncAstAsmFunction;
};

export type ContextValueKind = keyof ContextValues;

/**
 * The context containing the objects generated from the bottom-up in the generation
 * process and other intermediate information.
 */
export class CodegenContext {
    public ctx: CompilerContext;

    /** Generated functions. */
    private functions: Map<
        string,
        FuncAstFunctionDefinition | FuncAstAsmFunction
    > = new Map();

    constructor(ctx: CompilerContext) {
        this.ctx = ctx;
    }

    public add<K extends ContextValueKind>(
        kind: K,
        value: ContextValues[K],
    ): void {
        switch (kind) {
            case "function":
                const fun = value as
                    | FuncAstFunctionDefinition
                    | FuncAstAsmFunction;
                this.functions.set(fun.name.value, fun);
                break;
            default:
                throw new Error(`Unknown kind: ${kind}`);
        }
    }

    public has<K extends ContextValueKind>(kind: K, name: string) {
        switch (kind) {
            case "function":
                return this.functions.has(name);
            default:
                throw new Error(`Unknown kind: ${kind}`);
        }
    }

    /**
     * Returns all the generated functions that has non-asm body.
     */
    public getFunctions(): FuncAstFunctionDefinition[] {
        return Array.from(this.functions.values()).filter(
            (f): f is FuncAstFunctionDefinition =>
                f.kind === "function_definition",
        );
    }
}
