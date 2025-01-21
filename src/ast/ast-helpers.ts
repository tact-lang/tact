import * as A from "./ast";
import { AstId } from "./ast";
import { throwInternalCompilerError } from "../error/errors";
import { dummySrcInfo } from "../grammar";

/**
 * Check if input expression is a 'path expression',
 * i.e. an identifier or a sequence of field accesses starting from an identifier.
 * @param path A path expression to check.
 * @returns An array of identifiers or null if the input expression is not a path expression.
 */
export function tryExtractPath(path: A.AstExpression): A.AstId[] | null {
    switch (path.kind) {
        case "id":
            return [path];
        case "field_access": {
            const p = tryExtractPath(path.aggregate);
            return p ? [...p, path.field] : null;
        }
        default:
            return null;
    }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type DistributiveOmit<T, K extends keyof any> = T extends any
    ? Omit<T, K>
    : never;

export const getAstFactory = () => {
    let nextId = 1;
    function createNode(src: DistributiveOmit<A.AstNode, "id">): A.AstNode {
        return Object.freeze(Object.assign({ id: nextId++ }, src));
    }
    function cloneNode<T extends A.AstNode>(src: T): T {
        return { ...src, id: nextId++ };
    }
    return {
        createNode,
        cloneNode,
    };
};

export type FactoryAst = ReturnType<typeof getAstFactory>;

export function idText(ident: A.AstId | A.AstFuncId | A.AstTypeId): string {
    return ident.text;
}

export function isInt(ident: A.AstTypeId): boolean {
    return ident.text === "Int";
}

export function isBool(ident: A.AstTypeId): boolean {
    return ident.text === "Bool";
}

export function isCell(ident: A.AstTypeId): boolean {
    return ident.text === "Cell";
}

export function isSlice(ident: A.AstTypeId): boolean {
    return ident.text === "Slice";
}

export function isBuilder(ident: A.AstTypeId): boolean {
    return ident.text === "Builder";
}

export function isAddress(ident: A.AstTypeId): boolean {
    return ident.text === "Address";
}

export function isString(ident: A.AstTypeId): boolean {
    return ident.text === "String";
}

export function isStringBuilder(ident: A.AstTypeId): boolean {
    return ident.text === "StringBuilder";
}

export function isSelfId(ident: A.AstId): boolean {
    return ident.text === "self";
}

export function isWildcard(ident: A.AstId): boolean {
    return ident.text === "_";
}

export function isRequire(ident: A.AstId): boolean {
    return ident.text === "require";
}

export function eqNames(
    left: A.AstId | A.AstTypeId | string,
    right: A.AstId | A.AstTypeId | string,
): boolean {
    if (typeof left === "string") {
        if (typeof right === "string") {
            return left === right;
        }
        return left === right.text;
    } else {
        if (typeof right === "string") {
            return left.text === right;
        }
        return left.text === right.text;
    }
}

export function idOfText(text: string): A.AstId {
    return {
        kind: "id",
        text,
        id: 0,
        loc: dummySrcInfo,
    };
}

export function astNumToString(n: A.AstNumber): string {
    switch (n.base) {
        case 2:
            return `0b${n.value.toString(n.base)}`;
        case 8:
            return `0o${n.value.toString(n.base)}`;
        case 10:
            return n.value.toString(n.base);
        case 16:
            return `0x${n.value.toString(n.base)}`;
    }
}

// Test equality of AstExpressions.
// Note this is syntactical equality of expressions.
// For example, two struct instances are equal if they have the same
// type and same fields in the same order.
export function eqExpressions(
    ast1: A.AstExpression,
    ast2: A.AstExpression,
): boolean {
    if (ast1.kind !== ast2.kind) {
        return false;
    }

    switch (ast1.kind) {
        case "null":
            return true;
        case "boolean":
            return ast1.value === (ast2 as A.AstBoolean).value;
        case "number":
            return ast1.value === (ast2 as A.AstNumber).value;
        case "string":
            return ast1.value === (ast2 as A.AstString).value;
        case "id":
            return eqNames(ast1, ast2 as A.AstId);
        case "address":
            return ast1.value.equals((ast2 as A.AstAddress).value);
        case "cell":
            return ast1.value.equals((ast2 as A.AstCell).value);
        case "slice":
            return ast1.value
                .asCell()
                .equals((ast2 as A.AstSlice).value.asCell());
        case "comment_value":
            return ast1.value === (ast2 as A.AstCommentValue).value;
        case "simplified_string":
            return ast1.value === (ast2 as A.AstSimplifiedString).value;
        case "struct_value":
            return (
                eqNames(ast1.type, (ast2 as A.AstStructValue).type) &&
                eqArrays(
                    ast1.args,
                    (ast2 as A.AstStructValue).args,
                    eqFieldValues,
                )
            );
        case "method_call":
            return (
                eqNames(ast1.method, (ast2 as A.AstMethodCall).method) &&
                eqExpressions(ast1.self, (ast2 as A.AstMethodCall).self) &&
                eqArrays(
                    ast1.args,
                    (ast2 as A.AstMethodCall).args,
                    eqExpressions,
                )
            );
        case "init_of":
            return (
                eqNames(ast1.contract, (ast2 as A.AstInitOf).contract) &&
                eqArrays(ast1.args, (ast2 as A.AstInitOf).args, eqExpressions)
            );
        case "op_unary":
            return (
                ast1.op === (ast2 as A.AstOpUnary).op &&
                eqExpressions(ast1.operand, (ast2 as A.AstOpUnary).operand)
            );
        case "op_binary":
            return (
                ast1.op === (ast2 as A.AstOpBinary).op &&
                eqExpressions(ast1.left, (ast2 as A.AstOpBinary).left) &&
                eqExpressions(ast1.right, (ast2 as A.AstOpBinary).right)
            );
        case "conditional":
            return (
                eqExpressions(
                    ast1.condition,
                    (ast2 as A.AstConditional).condition,
                ) &&
                eqExpressions(
                    ast1.thenBranch,
                    (ast2 as A.AstConditional).thenBranch,
                ) &&
                eqExpressions(
                    ast1.elseBranch,
                    (ast2 as A.AstConditional).elseBranch,
                )
            );
        case "struct_instance":
            return (
                eqNames(ast1.type, (ast2 as A.AstStructInstance).type) &&
                eqArrays(
                    ast1.args,
                    (ast2 as A.AstStructInstance).args,
                    eqFieldInitializers,
                )
            );
        case "field_access":
            return (
                eqNames(ast1.field, (ast2 as A.AstFieldAccess).field) &&
                eqExpressions(
                    ast1.aggregate,
                    (ast2 as A.AstFieldAccess).aggregate,
                )
            );
        case "static_call":
            return (
                eqNames(ast1.function, (ast2 as A.AstStaticCall).function) &&
                eqArrays(
                    ast1.args,
                    (ast2 as A.AstStaticCall).args,
                    eqExpressions,
                )
            );
        default:
            throwInternalCompilerError("Unrecognized expression kind");
    }
}

function eqFieldInitializers(
    arg1: A.AstStructFieldInitializer,
    arg2: A.AstStructFieldInitializer,
): boolean {
    return (
        eqNames(arg1.field, arg2.field) &&
        eqExpressions(arg1.initializer, arg2.initializer)
    );
}

function eqFieldValues(
    arg1: A.AstStructFieldValue,
    arg2: A.AstStructFieldValue,
): boolean {
    return (
        eqNames(arg1.field, arg2.field) &&
        eqExpressions(arg1.initializer, arg2.initializer)
    );
}

function eqArrays<T>(
    arr1: T[],
    arr2: T[],
    eqElements: (elem1: T, elem2: T) => boolean,
): boolean {
    if (arr1.length !== arr2.length) {
        return false;
    }

    for (let i = 0; i < arr1.length; i++) {
        if (!eqElements(arr1[i]!, arr2[i]!)) {
            return false;
        }
    }

    return true;
}

/*
Functions that return guard types like "ast is AstLiteral" are unsafe to use in production code.
But there is a way to make them safe by introducing an intermediate function, like
the "checkLiteral" function defined below after "isLiteral". In principle, it is possible to use "checkLiteral"
directly in the code (which avoids the guard type altogether), but it produces code that reduces readability significantly.

The pattern shown with "isLiteral" and "checkLiteral" can be generalized to other functions that produce a guard type
based on a decision of several cases.
For example, if we have the following function, where we assume that B is a subtype of A:

function isB(d: A): d is B {
  if (cond1(d)) {        // It is assumed that cond1(d) determines d to be of type B inside the if
     return true;
  } else if (cond2(d)) { // It is assumed that cond2(d) determines d to be of type A but not of type B inside the if
     return false;
  } else if (cond3(d)) { // It is assumed that cond3(d) determines d to be of type B inside the if
     return true;
  } else {               // It is assumed that d is of type A but not of type B inside the else
     return false;
  }
}

We can introduce a "checkB" function as follows:

function checkB<T>(d: A, t: (arg: B) => T, f: (arg: Exclude<A,B>) => T): T {
  if (cond1(d)) {
     return t(d);
  } else if (cond2(d)) {
     return f(d);
  } else if (cond3(d)) {
     return t(d);
  } else {
     return f(d);
  }
}

Here, all the "true" cases return t(d) and all the "false" cases return f(d). The names of the functions t and f help remember
that they correspond to the true and false cases, respectively. Observe that cond1(d) and cond3(d) determine the type of
d to be B, which means we can pass d to the t function. For the false cases, the type of d is determined to be
A but not B, which means we can pass d to function f, because f's argument type Exclude<A,B> states
that the argument must be of type A but not of type B, i.e., of type "A - B" if we see the types as sets.

checkB is safe because the compiler will complain if, for example, we use t(d) in the else case:

function checkB<T>(d: A, t: (arg: B) => T, f: (arg: Exclude<A,B>) => T): T {
  if (cond1(d)) {
     return t(d);
  } else if (cond2(d)) {
     return f(d);
  } else if (cond3(d)) {
     return t(d);
  } else {
     return t(d);   // Compiler will signal an error that d is not assignable to type B
  }
}

Contrary to the original function, where the compiler remains silent if we incorrectly return true in the else:

function isB(d: A): d is B {
  if (cond1(d)) {
     return true;
  } else if (cond2(d)) {
     return false;
  } else if (cond3(d)) {
     return true;
  } else {
     return true;   // Wrong, but compiler remains silent
  }
}

After we have our "checkB" function, we can define the "isB" function simply as:

function isB(d: A): d is B {
  return checkB(d, () => true, () => false);
}
*/

export function isLiteral(ast: A.AstExpression): ast is A.AstLiteral {
    return checkLiteral(
        ast,
        () => true,
        () => false,
    );
}

export function checkLiteral<T>(
    ast: A.AstExpression,
    t: (node: A.AstLiteral) => T,
    f: (node: Exclude<A.AstExpression, A.AstLiteral>) => T,
): T {
    switch (ast.kind) {
        case "null":
        case "boolean":
        case "number":
        case "address":
        case "cell":
        case "slice":
        case "comment_value":
        case "simplified_string":
        case "struct_value":
            return t(ast);

        case "struct_instance":
        case "string":
        case "id":
        case "method_call":
        case "init_of":
        case "op_unary":
        case "op_binary":
        case "conditional":
        case "field_access":
        case "static_call":
            return f(ast);

        default:
            throwInternalCompilerError("Unrecognized expression kind");
    }
}

export const selfId: AstId = {
    kind: "id",
    text: "self",
    id: 0,
    loc: dummySrcInfo,
};
