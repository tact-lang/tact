import { ErrorDisplay } from "../error/display";

const attributeSchema =
    (name: string) =>
    <T, U>({ text, sub }: ErrorDisplay<T>, handle: (t: T) => U) => ({
        duplicate: (attr: string) => {
            return handle(
                sub`Duplicate ${text(name)} attribute "${text(attr)}"`,
            );
        },
        notAbstract: () => {
            return handle(
                sub`Abstract ${text(name)} doesn't have abstract modifier`,
            );
        },
        tooAbstract: () => {
            return handle(
                sub`Non-abstract ${text(name)} has abstract modifier`,
            );
        },
    });

const getExpectedText = (expected: ReadonlySet<string>) => {
    const result: string[] = [];
    const failures = [...expected].sort();
    for (const [idx, failure] of failures.entries()) {
        if (idx > 0) {
            if (idx === failures.length - 1) {
                result.push(failures.length > 2 ? ", or " : " or ");
            } else {
                result.push(", ");
            }
        }
        result.push(failure);
    }
    return result.join("");
};

export const syntaxErrorSchema = <T, U>(
    display: ErrorDisplay<T>,
    handle: (t: T) => U,
) => {
    const { sub, text } = display;

    return {
        constant: attributeSchema("constant")(display, handle),
        function: attributeSchema("function")(display, handle),
        topLevelConstantWithAttribute: () => {
            return handle(
                sub`Module-level constants do not support attributes`,
            );
        },
        literalTooLong: () => {
            return handle(sub`Bitstring has more than 128 digits`);
        },
        extraneousComma: () => {
            return handle(
                sub`Empty parameter list should not have a dangling comma`,
            );
        },
        duplicateField: (name: string) => {
            return handle(text(`Duplicate field destructuring: "${name}"`));
        },
        restShouldBeLast: () => {
            return handle(text(`Rest parameter should be last`));
        },
        importWithBackslash: () => {
            return handle(sub`Import path can't contain "\\"`);
        },
        reservedVarPrefix: (prefix: string) => {
            return handle(text(`Variable name cannot start with "${prefix}"`));
        },
        notCallable: () => {
            return handle(sub`Expression is not callable`);
        },
        noBouncedWithoutArg: () => {
            return handle(sub`bounced() cannot be used as fallback`);
        },
        noBouncedWithString: () => {
            return handle(
                sub`bounced() cannot be used with a string literal name`,
            );
        },
        noConstantDecl: () => {
            return handle(sub`Constant definition requires an initializer`);
        },
        noFunctionDecl: () => {
            return handle(sub`Only full function definitions are allowed here`);
        },
        expected: (expects: ReadonlySet<string>) => {
            return handle(text(`Expected ${getExpectedText(expects)}`));
        },
        invalidFuncId: () => {
            return handle(sub`Invalid FunC identifier`);
        },
        reservedFuncId: () => {
            return handle(sub`Reserved FunC identifier`);
        },
        numericFuncId: () => {
            return handle(sub`FunC identifier cannot be a number`);
        },
        leadingZeroUnderscore: () => {
            return handle(
                sub`Numbers with leading zeroes cannot use underscores for JS compatibility`,
            );
        },
        noFolderImports: () => {
            return handle(sub`Cannot import a folder`);
        },
        invalidImport: () => {
            return handle(sub`Import must start with ./, ../ or @stdlib/`);
        },
        escapingImport: () => {
            return handle(
                sub`Standard library imports should be inside its root`,
            );
        },
        asNotAllowed: () => {
            return handle(sub`"as" type is not allowed here`);
        },
        multipleOptionals: () => {
            return handle(sub`Nested optional types are not allowed`);
        },
        onlyOptionalOfNamed: () => {
            return handle(sub`Only named type can be optional`);
        },
        genericArgCount: (
            name: string,
            expectedCount: number,
            gotCount: number,
        ) => {
            return handle(
                sub`${text(name)}<> expects exactly ${text(String(expectedCount))} arguments, but got ${text(String(gotCount))}`,
            );
        },
        unknownType: (name: string) => {
            return handle(sub`Unknown generic type: ${text(name)}`);
        },
        onlyBouncedOfNamed: () => {
            return handle(sub`Only named type can be bounced<>`);
        },
        mapOnlyOneAs: (name: "key" | "value") => {
            return handle(
                sub`Cannot use several "as" on ${text(name)} of a map`,
            );
        },
        cannotBeOptional: (name: "key" | "value") => {
            return handle(sub`${text(name)} cannot be optional`);
        },
        onlyTypeId: (name: "key" | "value") => {
            return handle(sub`${text(name)} can only be a named type`);
        },
        fieldOnlyOneAs: () => {
            return handle(sub`Cannot use several "as" on a field type`);
        },
        noOptionalFieldType: () => {
            return handle(sub`Field type cannot be optional`);
        },
        fieldMustBeNamed: () => {
            return handle(sub`Only named type can be a type of a field`);
        },
        unknownGeneric: () => {
            return handle(sub`Unknown generic type`);
        },
    };
};

export type SyntaxErrors<T> = ReturnType<typeof syntaxErrorSchema<unknown, T>>;
