import { CompilerContext } from "../context";
import { enabledInline } from "../config/features";
import { getType, resolveTypeRef } from "../types/resolveDescriptors";
import { ops, funcIdOf } from "./util";
import { TypeDescription, FunctionDescription, TypeRef } from "../types/types";
import {
    FuncAstFunction,
    FuncAstStmt,
    FuncAstFormalFunctionParam,
    FuncAstFunctionAttribute,
    FuncAstExpr,
    FuncType,
    FuncTensorType,
    UNIT_TYPE,
} from "../func/syntax";
import { StatementGen } from "./statement";
import { resolveFuncTypeUnpack, resolveFuncType } from "./type";

/**
 * Encapsulates generation of Func functions from the Tact function.
 */
export class FunctionGen {
    /**
     * @param tactFun Type description of the Tact function.
     */
    private constructor(
        private ctx: CompilerContext,
        private tactFun: FunctionDescription,
    ) {}

    static fromTact(
        ctx: CompilerContext,
        tactFun: FunctionDescription,
    ): FunctionGen {
        return new FunctionGen(ctx, tactFun);
    }

    private resolveFuncPrimitive(
        descriptor: TypeRef | TypeDescription | string,
    ): boolean {
        // String
        if (typeof descriptor === "string") {
            return this.resolveFuncPrimitive(getType(this.ctx, descriptor));
        }

        // TypeRef
        if (descriptor.kind === "ref") {
            return this.resolveFuncPrimitive(
                getType(this.ctx, descriptor.name),
            );
        }
        if (descriptor.kind === "map") {
            return true;
        }
        if (descriptor.kind === "ref_bounced") {
            throw Error("Unimplemented: ref_bounced descriptor");
        }
        if (descriptor.kind === "void") {
            return true;
        }

        // TypeDescription
        if (descriptor.kind === "primitive_type_decl") {
            if (descriptor.name === "Int") {
                return true;
            } else if (descriptor.name === "Bool") {
                return true;
            } else if (descriptor.name === "Slice") {
                return true;
            } else if (descriptor.name === "Cell") {
                return true;
            } else if (descriptor.name === "Builder") {
                return true;
            } else if (descriptor.name === "Address") {
                return true;
            } else if (descriptor.name === "String") {
                return true;
            } else if (descriptor.name === "StringBuilder") {
                return true;
            } else {
                throw Error(`Unknown primitive type: ${descriptor.name}`);
            }
        } else if (descriptor.kind === "struct") {
            return false;
        } else if (descriptor.kind === "contract") {
            return false;
        }

        // Unreachable
        throw Error(`Unknown type: ${descriptor.kind}`);
    }

    /**
     * Generates Func function from the Tact funciton description.
     */
    public generate(): FuncAstFunction {
        if (this.tactFun.ast.kind !== "function_def") {
            throw new Error(`Unknown function kind: ${this.tactFun.ast.kind}`);
        }

        let returnTy = resolveFuncType(this.ctx, this.tactFun.returns);
        // let returnsStr: string | null;
        const self: TypeDescription | undefined = this.tactFun.self
            ? getType(this.ctx, this.tactFun.self)
            : undefined;
        if (self !== undefined && this.tactFun.isMutating) {
            // Add `self` to the method signature as it is mutating in the body.
            const selfTy = resolveFuncType(this.ctx, self);
            returnTy = { kind: "tensor", value: [selfTy, returnTy] };
            // returnsStr = resolveFuncTypeUnpack(ctx, self, funcIdOf("self"));
        }

        const params: FuncAstFormalFunctionParam[] = this.tactFun.params.reduce(
            (acc, a) => [
                ...acc,
                {
                    kind: "function_param",
                    ty: resolveFuncType(this.ctx, a.type),
                    name: funcIdOf(a.name),
                },
            ],
            self
                ? [
                      {
                          kind: "function_param",
                          ty: this.resolveFuncType(self),
                          name: funcIdOf("self"),
                      },
                  ]
                : [],
        );

        // TODO: handle native functions delcs. should be in a separatre funciton

        const name = self
            ? ops.extension(self.name, this.tactFun.name)
            : ops.global(this.tactFun.name);

        // Prepare function attributes
        let attrs: FuncAstFunctionAttribute[] = ["impure"];
        if (enabledInline(this.ctx) || this.tactFun.isInline) {
            attrs.push("inline");
        }
        // TODO: handle stdlib
        // if (f.origin === "stdlib") {
        //     ctx.context("stdlib");
        // }

        // Write function body
        const body: FuncAstStmt[] = [];

        // Add arguments
        if (self) {
            const varName = resolveFuncTypeUnpack(
                this.ctx,
                self,
                funcIdOf("self"),
            );
            const init: FuncAstExpr = {
                kind: "id_expr",
                value: funcIdOf("self"),
            };
            body.push({
                kind: "var_def_stmt",
                name: varName,
                init,
                ty: undefined,
            });
        }
        for (const a of this.tactFun.ast.params) {
            if (!this.resolveFuncPrimitive(resolveTypeRef(this.ctx, a.type))) {
                const name = resolveFuncTypeUnpack(
                    this.ctx,
                    resolveTypeRef(this.ctx, a.type),
                    funcIdOf(a.name),
                );
                const init: FuncAstExpr = {
                    kind: "id_expr",
                    value: funcIdOf(a.name),
                };
                body.push({ kind: "var_def_stmt", name, init, ty: undefined });
            }
        }

        const selfName =
            self !== undefined
                ? resolveFuncTypeUnpack(this.ctx, self, funcIdOf("self"))
                : undefined;
        // Process statements
        this.tactFun.ast.statements.forEach((stmt) => {
            const funcStmt = StatementGen.fromTact(
                this.ctx,
                stmt,
                selfName,
                this.tactFun.returns,
            ).writeStatement();
            body.push(funcStmt);
        });

        return { kind: "function", attrs, params, returnTy, body };
    }
}
