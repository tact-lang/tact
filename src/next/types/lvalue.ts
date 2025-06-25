/* eslint-disable require-yield */
import * as Ast from "@/next/ast";

export function* convertExprToLValue(
    node: Ast.CExpr,
): Ast.Log<undefined | Ast.LValue> {
    const result = yield* convertExprToLValueAux(node);
    if (result?.kind === 'self') {
        yield ENoSelfAssign(node.loc);
        return undefined;
    }
    return result;
}
const ENoSelfAssign = (loc: Ast.Loc) => Ast.TcError(
    loc,
    Ast.TEText(`Cannot assign to self`),
);

function* convertExprToLValueAux(
    node: Ast.CExpr,
): Ast.Log<undefined | Ast.LValue> {
    switch (node.kind) {
        case "field_access": {
            const aggregate = yield* convertExprToLValue(node.aggregate);
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            return (
                aggregate &&
                Ast.CLFieldAccess(
                    aggregate,
                    node.field,
                    node.computedType,
                    node.loc,
                )
            );
        }
        case "var":
        case "self": {
            return node;
        }
        case "string":
        case "number":
        case "boolean":
        case "op_binary":
        case "op_unary":
        case "conditional":
        case "method_call":
        case "static_call":
        case "static_method_call":
        case "struct_instance":
        case "init_of":
        case "code_of":
        case "null":
        case "unit":
        case "tuple":
        case "tensor":
        case "map_literal":
        case "set_literal": {
            yield ENotLValue(node.loc);
            return undefined;
        }
    }
}
const ENotLValue = (prev: Ast.Loc) => Ast.TcError(
    prev,
    Ast.TEText(
        `This expression cannot be used on the left side of assignment`,
    ),
    Ast.TECode(prev),
);
