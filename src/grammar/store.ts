import {
    AstModule,
    AstConstantDef,
    AstFunctionDef,
    AstNativeFunctionDecl,
    AstTypeDecl,
    AstAsmFunctionDef,
} from "./ast";
import { throwInternalCompilerError } from "../errors";
import { CompilerContext, createContextStore } from "../context";
import { ItemOrigin, parse } from "./grammar";

/**
 * @public
 */
export type TactSource = { code: string; path: string; origin: ItemOrigin };

/**
 * Represents the storage for all AST-related data within the compiler context.
 * @public
 * @property functions AST entries representing top-level functions.
 * @property constants AST entries representing top-level constant definitions.
 * @property types AST entries representing structures, contracts, and traits.
 */
export type AstStore = {
    sources: TactSource[];
    funcSources: { code: string; path: string }[];
    functions: (AstFunctionDef | AstNativeFunctionDecl | AstAsmFunctionDef)[];
    constants: AstConstantDef[];
    types: AstTypeDecl[];
};

const store = createContextStore<AstStore>();

/**
 * Retrieves the raw AST for the given context.
 * @public
 * @param ctx The compiler context from which the AST is retrieved.
 * @throws Will throw an error if the AST is not found in the context.
 * @returns The AST types associated with the context.
 */
export function getRawAST(ctx: CompilerContext): AstStore {
    const r = store.get(ctx, "types");
    if (!r) {
        throwInternalCompilerError("No AST found in context");
    }
    return r;
}

/**
 * Parses multiple Tact source files into AST modules.
 * @public
 */
export function parseModules(sources: TactSource[]): AstModule[] {
    return sources.map((source) =>
        parse(source.code, source.path, source.origin),
    );
}

/**
 * Extends the compiler context by adding AST entries and source information from
 * given sources and parsed programs.
 * @public
 * @param parsedModules An optional array of previously parsed programs. If not defined, they will be parsed from `sources`.
 * @returns The updated compiler context.
 */
export function openContext(
    ctx: CompilerContext,
    sources: TactSource[],
    funcSources: { code: string; path: string }[],
    parsedModules?: AstModule[],
): CompilerContext {
    const modules = parsedModules ? parsedModules : parseModules(sources);
    const types: AstTypeDecl[] = [];
    const functions: (
        | AstNativeFunctionDecl
        | AstFunctionDef
        | AstAsmFunctionDef
    )[] = [];
    const constants: AstConstantDef[] = [];
    for (const module of modules) {
        for (const item of module.items) {
            switch (item.kind) {
                case "struct_decl":
                case "message_decl":
                case "contract":
                case "trait":
                case "primitive_type_decl":
                    {
                        types.push(item);
                    }
                    break;
                case "function_def":
                case "asm_function_def":
                case "native_function_decl":
                    {
                        functions.push(item);
                    }
                    break;
                case "constant_def":
                    {
                        constants.push(item);
                    }
                    break;
            }
        }
    }
    ctx = store.set(ctx, "types", {
        sources,
        funcSources,
        functions,
        constants,
        types,
    });
    return ctx;
}
