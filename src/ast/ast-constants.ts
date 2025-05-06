import { keys } from "@/utils/tricks";
import type * as Ast from "@/ast/ast";

const augmentedAssignOperationsRecord: Record<
    Ast.AugmentedAssignOperation,
    true
> = {
    "+=": true,
    "-=": true,
    "*=": true,
    "/=": true,
    "&&=": true,
    "||=": true,
    "%=": true,
    "|=": true,
    "<<=": true,
    ">>=": true,
    "&=": true,
    "^=": true,
};

export const astAugmentedAssignOperations = Object.freeze(
    keys(augmentedAssignOperationsRecord),
);

const binaryOperationsRecord: Record<Ast.BinaryOperation, true> = {
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

const unaryOperationsRecord: Record<Ast.UnaryOperation, true> = {
    "+": true,
    "-": true,
    "!": true,
    "!!": true,
    "~": true,
};

export const astUnaryOperations = Object.freeze(keys(unaryOperationsRecord));

const numberBasesRecord: Record<Ast.NumberBase, true> = {
    2: true,
    8: true,
    10: true,
    16: true,
};

export const astNumberBases = Object.freeze(
    keys(numberBasesRecord).map(Number),
);

const importTypesRecord: Record<Ast.ImportType, true> = {
    stdlib: true,
    relative: true,
    package: true,
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

const functionAttributeNamesRecord: Record<Ast.FunctionAttributeName, true> = {
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
