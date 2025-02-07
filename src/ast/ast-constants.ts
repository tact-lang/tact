const augmentedAssignOperationsRecord = {
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
    Object.keys(augmentedAssignOperationsRecord),
);

const binaryOperationsRecord = {
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

export const astBinaryOperations = Object.freeze(
    Object.keys(binaryOperationsRecord),
);

const unaryOperationsRecord = {
    "+": true,
    "-": true,
    "!": true,
    "!!": true,
    "~": true,
};

export const astUnaryOperations = Object.freeze(
    Object.keys(unaryOperationsRecord),
);

const numberBasesRecord = {
    2: true,
    8: true,
    10: true,
    16: true,
};

export const astNumberBases = Object.freeze(
    Object.keys(numberBasesRecord).map(Number),
) as readonly number[];

// This is different from ItemOrigin, because relative import
// from standard library is still import with origin: "stdlib"
const importTypesRecord = {
    stdlib: true,
    relative: true,
};

export const importTypes = Object.freeze(Object.keys(importTypesRecord));

const constantAttributeNamesRecord = {
    virtual: true,
    override: true,
    abstract: true,
};

export const astConstantAttributeNames = Object.freeze(
    Object.keys(constantAttributeNamesRecord),
);

const functionAttributeNamesRecord = {
    mutates: true,
    extends: true,
    virtual: true,
    abstract: true,
    override: true,
    inline: true,
};

export const astFunctionAttributeNames = Object.freeze(
    Object.keys(functionAttributeNamesRecord),
);
