/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as Ast from "@/next/ast";

export function convertValueToExpr(node: Ast.Value): Ast.DecodedExpression {
    switch (node.kind) {
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        case "number": {
            return Ast.DNumber(
                "10",
                node.value,
                Ast.TypeInt(Ast.IFInt("signed", 257, node.loc), node.loc),
                node.loc,
            );
        }
    }
}
