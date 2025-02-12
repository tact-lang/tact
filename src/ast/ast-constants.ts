import { keys } from "../utils/tricks";
import type {
    AstAugmentedAssignOperation,
    AstBinaryOperation,
    AstFunctionAttributeName,
    AstNumberBase,
    AstUnaryOperation,
    ImportType,
} from "./ast";

const augmentedAssignOperationsRecord: Record<
    AstAugmentedAssignOperation,
    true
> = {
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

const binaryOperationsRecord: Record<AstBinaryOperation, true> = {
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

const unaryOperationsRecord: Record<AstUnaryOperation, true> = {
    "+": true,
    "-": true,
    "!": true,
    "!!": true,
    "~": true,
};

export const astUnaryOperations = Object.freeze(keys(unaryOperationsRecord));

const numberBasesRecord: Record<AstNumberBase, true> = {
    2: true,
    8: true,
    10: true,
    16: true,
};

export const astNumberBases = Object.freeze(
    keys(numberBasesRecord).map(Number),
);

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

const functionAttributeNamesRecord: Record<AstFunctionAttributeName, true> = {
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
