import {
    ASTProgram,
    ASTConstant,
    ASTFunction,
    ASTNativeFunction,
    ASTType,
} from "./ast";
import { CompilerContext, createContextStore } from "../context";
import { parse } from "./grammar";
import { TypeOrigin } from "../types/types";

export type TactSource = { code: string; path: string; origin: TypeOrigin };

/**
 * Represents the storage for all AST-related data within the compiler context.
 * @property functions AST entries representing top-level functions.
 * @property constants AST entries representing top-level constant definitions.
 * @property types AST entries representing structures, contracts, and traits.
 */
export type ASTStore = {
    sources: TactSource[];
    funcSources: { code: string; path: string }[];
    functions: (ASTFunction | ASTNativeFunction)[];
    constants: ASTConstant[];
    types: ASTType[];
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
 * Parses multiple Tact source files into AST programs.
 */
export function parsePrograms(sources: TactSource[]): ASTProgram[] {
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
    parsedPrograms?: ASTProgram[],
): CompilerContext {
    const programs = parsedPrograms ? parsedPrograms : parsePrograms(sources);
    const types: ASTType[] = [];
    const functions: (ASTNativeFunction | ASTFunction)[] = [];
    const constants: ASTConstant[] = [];
    for (const program of programs) {
        for (const entry of program.entries) {
            if (
                entry.kind === "def_struct" ||
                entry.kind === "def_contract" ||
                entry.kind === "def_trait" ||
                entry.kind === "primitive"
            ) {
                types.push(entry);
            } else if (
                entry.kind === "def_function" ||
                entry.kind === "def_native_function"
            ) {
                functions.push(entry);
            } else if (entry.kind === "def_constant") {
                constants.push(entry);
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
