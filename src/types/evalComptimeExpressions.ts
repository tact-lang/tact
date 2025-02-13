import { AstNode } from "../ast/ast";
import { FactoryAst } from "../ast/ast-helpers";
import { traverse } from "../ast/iterators";
import { AstUtil, getAstUtil } from "../ast/util";
import { CompilerContext } from "../context/context";
import {
    TactConstEvalError,
    throwCompilationError,
    throwConstEvalError,
} from "../error/errors";
import { SrcInfo } from "../grammar";
import { evalConstantExpression } from "../optimizer/constEval";
import { ensureInt } from "../optimizer/interpreter";
import { crc16 } from "../utils/crc16";
import {
    getAllStaticConstants,
    getAllStaticFunctions,
    getAllTypes,
} from "./resolveDescriptors";
import { ConstantDescription, FunctionDescription } from "./types";

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

export function evalComptimeExpressions(
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

    // Evaluate getter method IDs and check for collisions
    for (const t of getAllTypes(ctx)) {
        const methodIds: Map<number, string> = new Map();
        for (const f of t.functions.values()) {
            if (
                f.ast.kind !== "native_function_decl" &&
                f.ast.kind !== "function_decl" &&
                f.ast.kind !== "asm_function_def" &&
                f.isGetter
            ) {
                const methodId = getMethodId(f, ctx, util);
                const existing = methodIds.get(methodId);
                if (existing) {
                    throwCompilationError(
                        `Method ID collision: getter '${f.name}' has the same method ID ${methodId} as getter '${existing}'\nPick a different getter name or explicit method ID to avoid collisions`,
                        f.ast.name.loc,
                    );
                } else {
                    f.methodId = methodId;
                    methodIds.set(methodId, f.name);
                }
            }
        }
    }

    // FIXME: We need to do this hack to check shift operators. The code in the callback function checkShiftOperators
    // was previously in resolveExpressions.
    // Remove these calls to traverse and function checkShiftOperators once the partial evaluator is active.
    getAllStaticFunctions(ctx).forEach((fDesc) => {
        traverse(fDesc.ast, (n) => {
            checkShiftOperators(ctx, util, n);
        });
    });
    for (const t of getAllTypes(ctx)) {
        if (t.init) {
            traverse(t.init.ast, (n) => {
                checkShiftOperators(ctx, util, n);
            });
        }
        t.functions.forEach((fDesc) => {
            traverse(fDesc.ast, (n) => {
                checkShiftOperators(ctx, util, n);
            });
        });
        t.receivers.forEach((rDesc) => {
            traverse(rDesc.ast, (n) => {
                checkShiftOperators(ctx, util, n);
            });
        });
    }
}

function checkMethodId(methodId: bigint, loc: SrcInfo) {
    // method ids are 19-bit signed integers
    if (methodId < -(2n ** 18n) || methodId >= 2n ** 18n) {
        throwConstEvalError(
            "method ids must fit 19-bit signed integer range",
            true,
            loc,
        );
    }
    // method ids -4, -3, -2, -1, 0 ... 2^14 - 1 (inclusive) are kind of reserved by TVM
    // for the upper bound see F12_n (CALL) TVM instruction
    // and many small ids will be taken by internal procedures
    //
    // also, some ids are taken by the getters generated by Tact:
    // supported_interfaces -> 113617
    // lazy_deployment_completed -> 115390
    // get_abi_ipfs -> 121275
    if (-4n <= methodId && methodId < 2n ** 14n) {
        throwConstEvalError(
            "method ids cannot overlap with the TVM reserved ids: -4, -3, -2, -1, 0 ... 2^14 - 1",
            true,
            loc,
        );
    }
    const tactGeneratedGetterMethodIds = [113617n, 115390n, 121275n];
    if (tactGeneratedGetterMethodIds.includes(methodId)) {
        throwConstEvalError(
            `method ids cannot overlap with Tact reserved method ids: ${tactGeneratedGetterMethodIds.map((n) => n.toString()).join(", ")}`,
            true,
            loc,
        );
    }
}

function getMethodId(
    funcDescr: FunctionDescription,
    ctx: CompilerContext,
    util: AstUtil,
): number {
    const optMethodId = funcDescr.ast.attributes.find(
        (attr) => attr.type === "get",
    )?.methodId;

    if (optMethodId) {
        const methodId = ensureInt(
            evalConstantExpression(optMethodId, ctx, util),
        ).value;
        checkMethodId(methodId, optMethodId.loc);
        return Number(methodId);
    } else {
        const methodId = (crc16(funcDescr.name) & 0xffff) | 0x10000;
        checkMethodId(BigInt(methodId), funcDescr.ast.loc);
        return methodId;
    }
}

function checkShiftOperators(
    ctx: CompilerContext,
    util: AstUtil,
    ast: AstNode,
) {
    // poor man's constant propagation analysis (very local)
    // it works only in the case when the right-hand side is a constant expression
    // and does not have any variables
    if (ast.kind !== "op_binary") {
        return;
    }
    if (ast.op !== ">>" && ast.op !== "<<") {
        return;
    }

    try {
        const valBits = ensureInt(evalConstantExpression(ast.right, ctx, util));
        if (0n > valBits.value || valBits.value > 256n) {
            throwCompilationError(
                `the number of bits shifted ('${valBits.value}') must be within [0..256] range`,
                ast.right.loc,
            );
        }
    } catch (error) {
        if (!(error instanceof TactConstEvalError)) {
            throw error;
        }
    }
}
