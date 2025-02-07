import { keys } from "../utils/tricks";

type AugmentedAssignOperator =
    | "+"
    | "-"
    | "*"
    | "/"
    | "&&"
    | "||"
    | "%"
    | "|"
    | "<<"
    | ">>"
    | "&"
    | "^";

const augmentedAssignOperationsRecord: Record<AugmentedAssignOperator, true> = {
    "+": true,
    "-": true,
    "*": true,
    "/": true,
    "&&": true,
    "||": true,
    "%": true,
    "|": true,
    "<<": true,
    ">>": true,
    "&": true,
    "^": true,
};

export const astAugmentedAssignOperations = Object.freeze(
    keys(augmentedAssignOperationsRecord),
);

type BinaryOperator =
    | "+"
    | "-"
    | "*"
    | "/"
    | "!="
    | ">"
    | "<"
    | ">="
    | "<="
    | "=="
    | "&&"
    | "||"
    | "%"
    | "<<"
    | ">>"
    | "&"
    | "|"
    | "^";

const binaryOperationsRecord: Record<BinaryOperator, true> = {
    "+": true,
    "-": true,
    "*": true,
    "/": true,
    "!=": true,
    ">": true,
    "<": true,
    ">=": true,
    "<=": true,
    "==": true,
    "&&": true,
    "||": true,
    "%": true,
    "<<": true,
    ">>": true,
    "&": true,
    "|": true,
    "^": true,
};

export const astBinaryOperations = Object.freeze(keys(binaryOperationsRecord));

type UnaryOperator = "+" | "-" | "!" | "!!" | "~";

const unaryOperationsRecord: Record<UnaryOperator, true> = {
    "+": true,
    "-": true,
    "!": true,
    "!!": true,
    "~": true,
};

export const astUnaryOperations = Object.freeze(keys(unaryOperationsRecord));

type NumberBase = 2 | 8 | 10 | 16;

const numberBasesRecord: Record<NumberBase, true> = {
    2: true,
    8: true,
    10: true,
    16: true,
};

export const astNumberBases = Object.freeze(
    keys(numberBasesRecord).map(Number),
) as readonly number[];

// This is different from ItemOrigin, because relative import
// from standard library is still import with origin: "stdlib"
type ImportType = "stdlib" | "relative";

const importTypesRecord: Record<ImportType, true> = {
    stdlib: true,
    relative: true,
};

export const importTypes = Object.freeze(keys(importTypesRecord));

type ConstantAttributeName = "virtual" | "override" | "abstract";

const constantAttributeNamesRecord: Record<ConstantAttributeName, true> = {
    virtual: true,
    override: true,
    abstract: true,
};

export const astConstantAttributeNames = Object.freeze(
    keys(constantAttributeNamesRecord),
);

type FunctionAttributeName =
    | "mutates"
    | "extends"
    | "virtual"
    | "abstract"
    | "override"
    | "inline";

const functionAttributeNamesRecord: Record<FunctionAttributeName, true> = {
    mutates: true,
    extends: true,
    virtual: true,
    abstract: true,
    override: true,
    inline: true,
};

export const astFunctionAttributeNames = Object.freeze(
    keys(functionAttributeNamesRecord),
);
