import { enabledInline } from "../config/features";
import { getType, resolveTypeRef } from "../types/resolveDescriptors";
import { ops, funcIdOf } from "./util";
import { TypeDescription, FunctionDescription, TypeRef } from "../types/types";
import {
    FuncAstFunctionDefinition,
    FuncAstStmt,
    FuncAstFunctionAttribute,
    FuncAstExpr,
    FuncType,
} from "../func/syntax";
import { id, call, ret, fun, vardef, Type, tensor } from "../func/syntaxConstructors";
import { StatementGen, ExpressionGen, CodegenContext } from ".";
import { resolveFuncTypeUnpack, resolveFuncType } from "./type";

/**
 * Encapsulates generation of Func functions from the Tact function.
 */
export class FunctionGen {
    /**
     * @param tactFun Type description of the Tact function.
     */
    private constructor(private ctx: CodegenContext) {}

    static fromTact(ctx: CodegenContext): FunctionGen {
        return new FunctionGen(ctx);
    }

    private resolveFuncPrimitive(
        descriptor: TypeRef | TypeDescription | string,
    ): boolean {
        // String
        if (typeof descriptor === "string") {
            return this.resolveFuncPrimitive(getType(this.ctx.ctx, descriptor));
        }

        // TypeRef
        if (descriptor.kind === "ref") {
            return this.resolveFuncPrimitive(
                getType(this.ctx.ctx, descriptor.name),
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
    public writeFunction(
        tactFun: FunctionDescription,
    ): FuncAstFunctionDefinition {
        if (tactFun.ast.kind !== "function_def") {
            throw new Error(`Unknown function kind: ${tactFun.ast.kind}`);
        }

        let returnTy = resolveFuncType(this.ctx.ctx, tactFun.returns);
        // let returnsStr: string | null;
        const self: TypeDescription | undefined = tactFun.self
            ? getType(this.ctx.ctx, tactFun.self)
            : undefined;
        if (self !== undefined && tactFun.isMutating) {
            // Add `self` to the method signature as it is mutating in the body.
            const selfTy = resolveFuncType(this.ctx.ctx, self);
            returnTy = Type.tensor(selfTy, returnTy);
            // returnsStr = resolveFuncTypeUnpack(ctx, self, funcIdOf("self"));
        }

        const params: [string, FuncType][] = tactFun.params.reduce(
            (acc, a) => {
                acc.push([
                    funcIdOf(a.name),
                    resolveFuncType(this.ctx.ctx, a.type),
                ]);
                return acc;
            },
            self
                ? [[funcIdOf("self"), resolveFuncType(this.ctx.ctx, self)]]
                : [],
        );

        // TODO: handle native functions delcs. should be in a separatre funciton

        const name = self
            ? ops.extension(self.name, tactFun.name)
            : ops.global(tactFun.name);

        // Prepare function attributes
        let attrs: FuncAstFunctionAttribute[] = ["impure"];
        if (enabledInline(this.ctx.ctx) || tactFun.isInline) {
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
                this.ctx.ctx,
                self,
                funcIdOf("self"),
            );
            const init: FuncAstExpr = id(funcIdOf("self"));
            body.push(vardef(undefined, varName, init));
        }
        for (const a of tactFun.ast.params) {
            if (
                !this.resolveFuncPrimitive(resolveTypeRef(this.ctx.ctx, a.type))
            ) {
                const name = resolveFuncTypeUnpack(
                    this.ctx.ctx,
                    resolveTypeRef(this.ctx.ctx, a.type),
                    funcIdOf(a.name),
                );
                const init: FuncAstExpr = id(funcIdOf(a.name));
                body.push(vardef(undefined, name, init));
            }
        }

        const selfName =
            self !== undefined
                ? resolveFuncTypeUnpack(this.ctx.ctx, self, funcIdOf("self"))
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

        return fun(attrs, name, params, returnTy, body);
    }

    /**
     * Creates a Func function that represents a constructor for the Tact struct, e.g.:
     * ```
     * ((int, int)) $MyStruct$_constructor_f1_f2(int $f1, int $f2) inline {
     *     return ($f1, $f2);
     * }
     * ```
     *
     * @param type Type description of the struct for which the constructor is generated
     * @param args Names of the arguments
     */
    public writeStructConstructor(
        type: TypeDescription,
        args: string[],
    ): FuncAstFunctionDefinition {
        const attrs: FuncAstFunctionAttribute[] = ["inline"];
        const name = ops.typeConstructor(
            type.name,
            args.map((a) => a),
        );
        const returnTy = resolveFuncType(this.ctx.ctx, type);
        // Rename a struct constructor formal parameter to avoid
        // name clashes with FunC keywords, e.g. `struct Foo {type: Int}`
        // is a perfectly fine Tact structure, but its constructor would
        // have the wrong parameter name: `$Foo$_constructor_type(int type)`
        const avoidFunCKeywordNameClash = (p: string) => `$${p}`;
        const params: [string, FuncType][] = args.map((arg: string) => [
            avoidFunCKeywordNameClash(arg),
            resolveFuncType(
                this.ctx.ctx,
                type.fields.find((v2) => v2.name === arg)!.type,
            ),
        ]);
        // Create expressions used in actual arguments
        const values: FuncAstExpr[] = type.fields.map((v) => {
            const arg = args.find((v2) => v2 === v.name);
            if (arg) {
                return id(avoidFunCKeywordNameClash(arg));
            } else if (v.default !== undefined) {
                return ExpressionGen.writeValue(this.ctx, v.default);
            } else {
                throw Error(
                    `Missing argument for field "${v.name}" in struct "${type.name}"`,
                ); // Must not happen
            }
        });
        const body =
            values.length === 0 && returnTy.kind === "tuple"
                ? [ret(call("empty_tuple", []))]
                : [ret(tensor(...values))];
        return fun(attrs, name, params, returnTy, body);
    }
}
