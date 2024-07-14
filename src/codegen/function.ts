import { CompilerContext } from "../context";
import { enabledInline } from "../config/features";
import { getType, resolveTypeRef } from "../types/resolveDescriptors";
import { ops, funcIdOf } from "./util";
import { ExpressionGen } from "./expression";
import { AstId } from "../grammar/ast";
import { TypeDescription, FunctionDescription, TypeRef } from "../types/types";
import {
    FuncAstFunction,
    FuncAstStmt,
    FuncAstFunctionAttribute,
    FuncAstExpr,
    FuncType,
} from "../func/syntax";
import {
    makeId,
    makeCall,
    makeReturn,
    makeFunction,
} from "../func/syntaxUtils";
import { StatementGen } from "./statement";
import { resolveFuncTypeUnpack, resolveFuncType } from "./type";

/**
 * Encapsulates generation of Func functions from the Tact function.
 */
export class FunctionGen {
    /**
     * @param tactFun Type description of the Tact function.
     */
    private constructor(private ctx: CompilerContext) {}

    static fromTact(ctx: CompilerContext): FunctionGen {
        return new FunctionGen(ctx);
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
    public writeFunction(tactFun: FunctionDescription): FuncAstFunction {
        if (tactFun.ast.kind !== "function_def") {
            throw new Error(`Unknown function kind: ${tactFun.ast.kind}`);
        }

        let returnTy = resolveFuncType(this.ctx, tactFun.returns);
        // let returnsStr: string | null;
        const self: TypeDescription | undefined = tactFun.self
            ? getType(this.ctx, tactFun.self)
            : undefined;
        if (self !== undefined && tactFun.isMutating) {
            // Add `self` to the method signature as it is mutating in the body.
            const selfTy = resolveFuncType(this.ctx, self);
            returnTy = { kind: "tensor", value: [selfTy, returnTy] };
            // returnsStr = resolveFuncTypeUnpack(ctx, self, funcIdOf("self"));
        }

        const params: [string, FuncType][] = tactFun.params.reduce(
            (acc, a) => {
                acc.push([funcIdOf(a.name), resolveFuncType(this.ctx, a.type)]);
                return acc;
            },
            self ? [[funcIdOf("self"), resolveFuncType(this.ctx, self)]] : [],
        );

        // TODO: handle native functions delcs. should be in a separatre funciton

        const name = self
            ? ops.extension(self.name, tactFun.name)
            : ops.global(tactFun.name);

        // Prepare function attributes
        let attrs: FuncAstFunctionAttribute[] = ["impure"];
        if (enabledInline(this.ctx) || tactFun.isInline) {
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
        for (const a of tactFun.ast.params) {
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
        tactFun.ast.statements.forEach((stmt) => {
            const funcStmt = StatementGen.fromTact(
                this.ctx,
                stmt,
                selfName,
                tactFun.returns,
            ).writeStatement();
            body.push(funcStmt);
        });

        return makeFunction(attrs, name, params, returnTy, body);
    }

    /**
     * Creates a Func function that represents a constructor for the Tact struct, e.g.:
     * ```
     * ((int, int)) $MyStruct$_constructor_f1_f2(int $f1, int $f2) inline {
     *     return ($f1, $f2);
     * }
     * ```
     */
    private writeStructConstructor(
        type: TypeDescription,
        args: AstId[],
    ): FuncAstFunction {
        const attrs: FuncAstFunctionAttribute[] = ["inline"];
        const name = ops.typeConstructor(
            type.name,
            args.map((a) => a.text),
        );
        const returnTy = resolveFuncType(this.ctx, type);
        // Rename a struct constructor formal parameter to avoid
        // name clashes with FunC keywords, e.g. `struct Foo {type: Int}`
        // is a perfectly fine Tact structure, but its constructor would
        // have the wrong parameter name: `$Foo$_constructor_type(int type)`
        const avoidFunCKeywordNameClash = (p: string) => `$${p}`;
        const params: [string, FuncType][] = args.map((arg: AstId) => [
            avoidFunCKeywordNameClash(arg.text),
            resolveFuncType(
                this.ctx,
                type.fields.find((v2) => v2.name === arg.text)!.type,
            ),
        ]);
        // Create expressions used in actual arguments
        const values: FuncAstExpr[] = type.fields.map((v) => {
            const arg = args.find((v2) => v2.text === v.name);
            if (arg) {
                return makeId(avoidFunCKeywordNameClash(arg.text));
            } else if (v.default !== undefined) {
                return ExpressionGen.writeValue(v.default);
            } else {
                throw Error(
                    `Missing argument for field "${v.name}" in struct "${type.name}"`,
                ); // Must not happen
            }
        });
        const body =
            values.length === 0 && returnTy.kind === "tuple"
                ? [makeReturn(makeCall("empty_tuple", []))]
                : [makeReturn({ kind: "tensor_expr", values })];
        return makeFunction(attrs, name, params, returnTy, body);
    }
}
