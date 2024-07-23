import { CompilerContext } from "../context";
import { topologicalSort } from "../utils/utils";
import { FuncAstFunctionDefinition, FuncAstAsmFunction } from "../func/syntax";

/**
 * An additional information on how to handle the function definition.
 * TODO: Refactor: we need only the boolean `skip` field in WrittenFunction.
 * XXX: Writer.ts: `Body.kind`
 */
export type BodyKind = "asm" | "skip" | "generic";

/**
 * Replicates the `ctx.context` parameter of the old backends Writer context.
 * Basically, it tells in which file the context value should be located in the
 * generated Func code.
 *
 * TODO: Should be refactored; `type` seems to be redundant
 */
export type LocationContext =
    | { kind: "stdlib" }
    | { kind: "constants" }
    | { kind: "type"; value: string };

export class Location {
    public static stdlib(): LocationContext {
        return { kind: "stdlib" };
    }

    public static constants(): LocationContext {
        return { kind: "constants" };
    }

    public static type(value: string): LocationContext {
        return { kind: "type", value };
    }
}

// TODO: Rename when refactoring
export type WrittenFunction = {
    name: string;
    definition: FuncAstFunctionDefinition | FuncAstAsmFunction;
    kind: BodyKind;
    context: LocationContext | undefined;
    depends: Set<string>;
};

/**
 * The context containing the objects generated from the bottom-up in the generation
 * process and other intermediate information.
 */
export class CodegenContext {
    public ctx: CompilerContext;

    /** Generated functions. */
    private functions: Map<string, WrittenFunction> = new Map();

    constructor(ctx: CompilerContext) {
        this.ctx = ctx;
    }

    public addFunction(
        value: FuncAstFunctionDefinition | FuncAstAsmFunction,
        params: Partial<{ kind: BodyKind; context: LocationContext }> = {},
    ): void {
        const { kind = "generic", context = undefined } = params;
        const definition = value as
            | FuncAstFunctionDefinition
            | FuncAstAsmFunction;
        const depends: Set<string> = new Set();
        this.functions.set(definition.name.value, {
            name: definition.name.value,
            definition,
            kind,
            context,
            depends,
        });
    }

    public hasFunction(name: string) {
        return this.functions.has(name);
    }

    public allFunctions(): WrittenFunction[] {
        return Array.from(this.functions.values());
    }

    /**
     * XXX: Replicates WriteContext.extract
     */
    public extract(debug: boolean = false): WrittenFunction[] {
        // Check dependencies
        const missing: Map<string, string[]> = new Map();
        for (const f of this.functions.values()) {
            for (const d of f.depends) {
                if (!this.functions.has(d)) {
                    if (!missing.has(d)) {
                        missing.set(d, [f.name]);
                    } else {
                        missing.set(d, [...missing.get(d)!, f.name]);
                    }
                }
            }
        }
        if (missing.size > 0) {
            throw new Error(
                `Functions ${Array.from(missing.keys())
                    .map((v) => `"${v}"`)
                    .join(", ")} wasn't added to the context`,
            );
        }

        // All functions
        let all = this.allFunctions();

        // TODO: Remove unused
        // if (!debug) {
        //     const used: Set<string> = new Set();
        //     const visit = (name: string) => {
        //         used.add(name);
        //         const f = this.functions.get(name);
        //         if (f === undefined) {
        //             throw new Error(
        //                 `Cannot find functon ${name} within the CodegenContext`,
        //             );
        //         }
        //         for (const d of f.depends) {
        //             visit(d);
        //         }
        //     };
        //     visit("$main");
        //     all = all.filter((v) => used.has(v.name));
        // }

        // Sort functions
        const sorted = topologicalSort(all, (f) =>
            Array.from(f.depends).map((v) => this.functions.get(v)!),
        );

        return sorted;
    }
}
