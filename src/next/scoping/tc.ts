import { makeVisitor } from "@/utils/tricks";
import type { Range } from "@/next/ast";
import type { Logger, SourceLogger } from "@/error/logger-util";
import type { TactSource } from "@/next/imports/source";
import type * as Ast from "@/next/ast/root";

const TcErrors = <M, R>(l: SourceLogger<M, R>) => ({
    // FIXME
    foo: () => (loc: Range) => {
        return l.at(loc).error(l.text`Bar`);
    },

    duplicateParam: () => (loc: Range) => {
        return l.at(loc).error(l.text`Duplicate parameter`);
    },
    duplicateDecl: () => (loc: Range) => {
        return l.at(loc).error(l.text`Duplicate declaration`);
    },
});

type TcErrors<M, R> = ReturnType<typeof TcErrors<M, R>>;

type Name = string;
type Context = {
    log: Logger<string, void>;
    err: TcErrors<string, void>;

    typeNames: Map<Name, TypeDecls>;
};
type Tc = (ctx: Context) => void;

const tcDummy = (): Tc => () => {};

const map =
    <T>(ts: readonly T[], handler: (t: T) => Tc): Tc =>
    (ctx) => {
        for (const t of ts) {
            handler(t)(ctx);
        }
    };

export const tcSource =
    ({ path, code, imports, items }: TactSource): Tc =>
    (ctx) => {
        ctx.log.source(path, code, (log) => {
            const newCtx: Context = {
                log: ctx.log,
                err: TcErrors(log),
                typeNames: new Map(),
            };
            map(items, collectTypeEnv)(newCtx);
            map(items, tcModuleItem)(newCtx);
        });
    };

type TypeDecls =
    | Ast.StructDecl
    | Ast.MessageDecl
    | Ast.UnionDecl
    | Ast.AliasDecl
    | Ast.Contract
    | Ast.Trait;

const collectTypeEnvStruct =
    (node: TypeDecls): Tc =>
    (ctx) => {
        const prev = ctx.typeNames.get(node.name.text);
        if (typeof prev !== "undefined") {
            ctx.err.duplicateDecl()(node.loc);
        } else {
            ctx.typeNames.set(node.name.text, node);
        }
    };

const collectTypeEnv = makeVisitor<Ast.ModuleItem>()({
    function_def: tcDummy,
    asm_function_def: tcDummy,
    native_function_decl: tcDummy,
    constant_def: tcDummy,

    struct_decl: collectTypeEnvStruct,
    message_decl: collectTypeEnvStruct,
    union_decl: collectTypeEnvStruct,
    alias_decl: collectTypeEnvStruct,
    contract: collectTypeEnvStruct,
    trait: collectTypeEnvStruct,
});

const checkParamDuplicates =
    (params: readonly Ast.AsmTypedParameter[]): Tc =>
    (ctx) => {
        const names: Set<string> = new Set<string>();
        for (const {
            name: { text },
            loc,
        } of params) {
            if (names.has(text)) {
                ctx.err.duplicateParam()(loc);
            } else {
                names.add(text);
            }
        }
    };

// AsmFunctionDef:
// Cannot use ... attrubute on global assembly functions
// attributes kind == "get"
// attributes kind == "virtual" | "abstract" | "override" | "inline"

// Only a method can be mutating. Did you forget "extends"?
// attributes kind has "mutates", doesn't have "extends"

// Duplicate function definition
// (imports* AsmFunctionDef name) . size > 1

// Duplicate parameter
// asm fun f(x: Int, x: Foo) {}
// (Source AsmFunctionDef params name) . size > 1

// Type is not defined
// asm fun f(x: Nonexist) {}
// AsmFunctionDef (params type | retType) Type/TypeCons:
//   .name !in (imports* TypeDecl name | .typeParams)

// `F` expects 1 argument. Passed 2 arguments.
// struct F<T> {} asm fun f(x: F<Int, Int>) {}
// AsmFunctionDef (params type | retType) Type/TypeCons typeArgs length
//   != imports* TypeDecl typeParams length

// `F` type parameter is shadowing globally defined type
// struct F<T> {} asm fun f<F>(x: F) {}
// AsmFunctionDef typeParams name
//   in imports* TypeDecl name

// TypeDecl = StructDecl | MessageDecl | UnionDecl | AliasDecl | Contract | Trait

// Duplicate type parameter
// (Source AsmFunctionDef typeParams name) . size > 1

// Shuffle must be a permutation of all function parameters
// asm(c c) extends fun f(self: Builder, c: Cell?) {}
// AsmFunctionDef: (.shuffle args text).sort() = (.params name text).sort()

// extends fun попадают в скоуп self
// trait A { abstract fun f(): Int; }
// contract B {}
// override extends asm fun f(self: B): Int {}

const tcAsmFunction =
    ({
        attributes,
        name,
        params,
        return: retType,
        shuffle,
        typeParams,
        loc,
    }: Ast.AsmFunctionDef): Tc =>
    (ctx) => {
        checkParamDuplicates(params)(ctx);

        for (const arg of shuffle.args) {
            arg.text;
        }
    };

const tcModuleItem = makeVisitor<Ast.ModuleItem>()({
    function_def: tcDummy,
    asm_function_def: tcAsmFunction,
    native_function_decl: tcDummy,
    constant_def: tcDummy,

    struct_decl: tcDummy,
    message_decl: tcDummy,
    union_decl: tcDummy,
    alias_decl: tcDummy,
    contract: tcDummy,
    trait: tcDummy,
});
