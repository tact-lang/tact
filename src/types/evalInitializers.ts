import { FactoryAst } from "../ast/ast-helpers";
import { AstUtil, getAstUtil } from "../ast/util";
import { CompilerContext } from "../context/context";
import { evalConstantExpression } from "../optimizer/constEval";
import { getAllStaticConstants, getAllTypes } from "./resolveDescriptors";
import { ConstantDescription } from "./types";

function initializeConstants(
    constants: ConstantDescription[],
    ctx: CompilerContext,
    util: AstUtil,
) {
    for (const constant of constants) {
        if (constant.ast.kind === "constant_def") {
            constant.value ??= evalConstantExpression(
                constant.ast.initializer,
                ctx,
                util,
            );
        }
    }
}

export function evaluateDeclarationsInitializers(
    ctx: CompilerContext,
    astF: FactoryAst,
) {
    const util = getAstUtil(astF);
    const staticConstants = getAllStaticConstants(ctx);

    for (const aggregateTy of getAllTypes(ctx)) {
        switch (aggregateTy.kind) {
            case "primitive_type_decl":
                break;
            case "trait":
            case "contract":
            case "struct": {
                {
                    for (const field of aggregateTy.fields) {
                        if (field.ast.initializer !== null) {
                            field.default = evalConstantExpression(
                                field.ast.initializer,
                                ctx,
                                util,
                            );
                        } else {
                            // if a field has optional type and it is missing an explicit initializer
                            // we consider it to be initialized with the null value

                            field.default =
                                field.type.kind === "ref" && field.type.optional
                                    ? util.makeNullLiteral(field.ast.loc)
                                    : undefined;
                        }
                    }

                    // Initialize constants after fields to ensure default struct fields can be used in constants, like
                    // struct S {f: Int = 42}
                    // const A: Int = S{}.f;
                    initializeConstants(aggregateTy.constants, ctx, util);
                }
                break;
            }
        }
    }

    // We initialize all remaining uninitialized constants,
    // the constant may already be initialized since we call initialization recursively
    // if one constant depends on another
    initializeConstants(staticConstants, ctx, util);
}
