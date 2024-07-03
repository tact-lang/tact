import {
    AstModule,
    AstConstantDef,
    AstFunctionDef,
    AstNativeFunctionDecl,
    AstTypeDecl,
} from "./ast";
import { CompilerContext, createContextStore } from "../context";
import { ItemOrigin, parse } from "./grammar";

export type TactSource = { code: string; path: string; origin: ItemOrigin };

/**
 * Represents the storage for all AST-related data within the compiler context.
 * @property functions AST entries representing top-level functions.
 * @property constants AST entries representing top-level constant definitions.
 * @property types AST entries representing structures, contracts, and traits.
 */
export type ASTStore = {
    sources: TactSource[];
    funcSources: { code: string; path: string }[];
    functions: (AstFunctionDef | AstNativeFunctionDecl)[];
    constants: AstConstantDef[];
    types: AstTypeDecl[];
};

const store = createContextStore<ASTStore>();

/**
 * Retrieves the raw AST for the given context.
 * @param ctx The compiler context from which the AST is retrieved.
 * @throws Will throw an error if the AST is not found in the context.
 * @returns The AST types associated with the context.
 */
export function getRawAST(ctx: CompilerContext) {
    const r = store.get(ctx, "types");
    if (!r) {
        throw Error("No AST found in context");
    }
    return r;
}

/**
 * Parses multiple Tact source files into AST modules.
 */
export function parseModules(sources: TactSource[]): AstModule[] {
    return sources.map((source) =>
        parse(source.code, source.path, source.origin),
    );
}

/**
 * Extends the compiler context by adding AST entries and source information from
 * given sources and parsed programs.
 * @param parsedPrograms An optional array of previously parsed programs. If not defined, they will be parsed from `sources`.
 * @returns The updated compiler context.
 */
export function openContext(
    ctx: CompilerContext,
    sources: TactSource[],
    funcSources: { code: string; path: string }[],
    parsedPrograms?: AstModule[],
): CompilerContext {
    const programs = parsedPrograms ? parsedPrograms : parseModules(sources);
    const types: AstTypeDecl[] = [];
    const functions: (AstNativeFunctionDecl | AstFunctionDef)[] = [];
    const constants: AstConstantDef[] = [];
    for (const program of programs) {
        for (const item of program.items) {
            if (
                item.kind === "struct_decl" ||
                item.kind === "message_decl" ||
                item.kind === "contract" ||
                item.kind === "trait" ||
                item.kind === "primitive_type_decl"
            ) {
                types.push(item);
            } else if (
                item.kind === "function_def" ||
                item.kind === "native_function_decl"
            ) {
                functions.push(item);
            } else if (item.kind === "constant_def") {
                constants.push(item);
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
