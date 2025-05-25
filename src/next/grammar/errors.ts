import type { SourceLogger } from "@/error/logger-util";
import type { Range } from "@/error/range";
import { ImportErrors } from "@/next/grammar/import-parser";

const attributeSchema = <M, R>(name: string, l: SourceLogger<M, R>) => ({
    duplicate: (attr: string) => (loc: Range) => {
        return l.at(loc).error(l.text`Duplicate ${name} attribute "${attr}"`);
    },
    notAbstract: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Abstract ${name} can only be declared inside traits and should have the abstract modifier`,
            );
    },
    tooAbstract: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Non-abstract ${name} has abstract modifier`);
    },
});

export const SyntaxErrors = <M, R>(l: SourceLogger<M, R>) => ({
    constant: attributeSchema("constant", l),
    function: attributeSchema("function", l),
    imports: ImportErrors(l),

    topLevelConstantWithAttribute: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Module-level constants do not support attributes`);
    },
    literalTooLong: () => (loc: Range) => {
        return l.at(loc).error(l.text`Bitstring has more than 128 digits`);
    },
    extraneousComma: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Empty parameter list should not have a dangling comma`,
            );
    },
    duplicateField: (name: string) => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Duplicate field destructuring: "${name}"`);
    },
    restShouldBeLast: () => (loc: Range) => {
        return l.at(loc).error(l.text`Rest parameter should be last`);
    },
    reservedVarPrefix: (prefix: string) => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Variable name cannot start with "${prefix}"`);
    },
    notCallable: () => (loc: Range) => {
        return l.at(loc).error(l.text`Expression is not callable`);
    },
    noBouncedWithoutArg: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`bounced() receiver should accept a Message, bounced<Message> or Slice`,
            );
    },
    noBouncedWithString: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`bounced() receiver can only accept a Message, bounced<Message> or Slice`,
            );
    },
    noConstantDecl: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Constant definition requires an initializer`);
    },
    noFunctionDecl: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Only full function definitions are allowed here`);
    },
    expected: (expects: ReadonlySet<string>) => (loc: Range) => {
        return l.at(loc).error(l.expected(expects));
    },
    invalidFuncId: () => (loc: Range) => {
        return l.at(loc).error(l.text`Invalid FunC identifier`);
    },
    reservedFuncId: () => (loc: Range) => {
        return l.at(loc).error(l.text`Reserved FunC identifier`);
    },
    numericFuncId: () => (loc: Range) => {
        return l.at(loc).error(l.text`FunC identifier cannot be a number`);
    },
    leadingZeroUnderscore: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Numbers with leading zeroes cannot use underscores for JS compatibility`,
            );
    },
    asNotAllowed: () => (loc: Range) => {
        return l.at(loc).error(l.text`"as" type is not allowed here`);
    },
    multipleOptionals: () => (loc: Range) => {
        return l.at(loc).error(l.text`Nested optional types are not allowed`);
    },
    onlyOptionalOfNamed: () => (loc: Range) => {
        return l.at(loc).error(l.text`Only named type can be optional`);
    },
    genericArgCount:
        (name: string, expectedCount: number, gotCount: number) =>
        (loc: Range) => {
            return l
                .at(loc)
                .error(
                    l.text`${name}<> expects exactly ${String(expectedCount)} arguments, but got ${String(gotCount)}`,
                );
        },
    unknownType: (name: string) => (loc: Range) => {
        return l.at(loc).error(l.text`Unknown generic type: ${name}`);
    },
    onlyBouncedOfNamed: () => (loc: Range) => {
        return l.at(loc).error(l.text`Only named type can be bounced<>`);
    },
    mapOnlyOneAs: (name: "key" | "value") => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Cannot use several "as" on ${name} of a map`);
    },
    cannotBeOptional: (name: "key" | "value") => (loc: Range) => {
        return l.at(loc).error(l.text`${name} cannot be optional`);
    },
    onlyTypeId: (name: "key" | "value") => (loc: Range) => {
        return l.at(loc).error(l.text`${name} can only be a named type`);
    },
    fieldOnlyOneAs: () => (loc: Range) => {
        return l.at(loc).error(l.text`Cannot use several "as" on a field type`);
    },
    noOptionalFieldType: () => (loc: Range) => {
        return l.at(loc).error(l.text`Field type cannot be optional`);
    },
    fieldMustBeNamed: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Only named type can be a type of a field`);
    },
    unknownGeneric: () => (loc: Range) => {
        return l.at(loc).error(l.text`Unknown generic type`);
    },
    noWildcard: () => (loc: Range) => {
        return l.at(loc).error(l.text`Wildcard not allowed here`);
    },
    undefinedUnicodeCodepoint: () => (loc: Range) => {
        return l.at(loc).error(l.text`Undefined Unicode code-point`);
    },
    unsupportedAsmFunctionInContracts: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Assembly functions are only allowed at the module level - outside contracts or traits`,
            );
    },
    duplicateAs: () => (loc: Range) => {
        return l.at(loc).error(l.text`"as" cannot be nested`);
    },
    typeArity: (name: string, expected: number) => (loc: Range) => {
        return l.at(loc).error(l.text`${name}<> expects ${String(expected)} arguments`);
    },
    wrongVarIntSize: () => (loc: Range) => {
        return l.at(loc).error(l.text`Varint can only be 16 or 32 bits wide`);
    },
    wrongUIntSize: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Unsigned integer must be 1 to 256 bits wide`);
    },
    wrongIntSize: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Signed integer must be 1 to 257 bits wide`);
    },
    wrongFormat: (name: string) => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`${name} cannot be defined with this storage format`);
    },
    wrongSliceSize: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Slice byte format must either be 32 or 64`);
    },
    rawRemaining: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Remaining can only be used as storage type on Slice, cell, or Builder`,
            );
    },
    cannotHaveFormat: () => (loc: Range) => {
        return l.at(loc).error(l.text`This type cannot have format definition`);
    },
    deprecatedPrimitiveDecl: () => (_loc: Range) => {
        // FIXME: enable after src2 replaces src
        // l.at(loc).warn(l.text`"primitive" type declaration are deprecated`);
    },
    constDeclNoType: () => (loc: Range) => {
        return l.at(loc).error(l.text`Constant declaration must have a type`);
    },
    mapArgCount: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`map<K, V> takes exactly two type arguments`);
    },
    setArgCount: () => (loc: Range) => {
        return l.at(loc).error(l.text`set<V> takes exactly one type argument`);
    },
    abstractVirtual: () => (loc: Range) => {
        return l.at(loc).error(l.text`"abstract" and "virtual" attributes cannot be used at the same time`);
    },
    abstractOverride: () => (loc: Range) => {
        return l.at(loc).error(l.text`"abstract" and "override" attributes cannot be used at the same time`);
    },
    globalGetter: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`"Getters must be defined within a contract"`);
    },
    mutatesWithoutExtends: () => (loc: Range) => {
        return l
            .at(loc)
            .error(l.text`Mutating functions must be extend functions`);
    },
    extendsSelf: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Extend function must have first parameter named "self"`,
            );
    },
    globalWithAttr: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Globally defined functions cannot have "abstract", "virtual", or "override" attributes`,
            );
    },
    globalConstWithAttr: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Globally defined constants cannot have "abstract", "virtual", or "override" attributes`,
            );
    },
    localExtends: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Only globally defined function can be an extension method`,
            );
    },
    tooMuchInit: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Init function was already defined`,
            );
    },
    initFnAndParams: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Cannot define init() on a contract that has contract parameters`,
            );
    },
    abstractWithBody: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Abstract declaration cannot have a body`,
            );
    },
    noBodyNoAbstract: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`Declaration without a body must be abstract`,
            );
    },
    mustBeGeneric: () => (loc: Range) => {
        return l
            .at(loc)
            .error(
                l.text`This type must be generic`,
            );
    },
});

export type SyntaxErrors<M, R> = ReturnType<typeof SyntaxErrors<M, R>>;
