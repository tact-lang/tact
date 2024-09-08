import { enabledInline } from "../config/features";
import { getType, resolveTypeRef } from "../types/resolveDescriptors";
import { ops, funcIdOf } from "./util";
import { FuncPrettyPrinter } from "../func/prettyPrinter";
import { TypeDescription, FunctionDescription, TypeRef } from "../types/types";
import {
    FuncAstFunctionDefinition,
    FuncAstStatement,
    FuncAstFunctionAttribute,
    FuncAstExpression,
    FuncAstType,
} from "../func/grammar";
import { idText, AstNativeFunctionDecl } from "../grammar/ast";
import {
    id,
    call,
    ret,
    FunAttr,
    vardef,
    Type,
    tensor,
} from "../func/syntaxConstructors";
import { StatementGen, LiteralGen, WriterContext, Location } from ".";
import { resolveFuncTypeUnpack, resolveFuncType } from "./type";

/**
 * Encapsulates generation of Func functions from the Tact function.
 */
export class FunctionGen {
    /**
     * @param tactFun Type description of the Tact function.
     */
    private constructor(private ctx: WriterContext) {}

    static fromTact(ctx: WriterContext): FunctionGen {
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

    public writeNativeFunction(f: FunctionDescription): void | never {
        if (f.ast.kind !== "native_function_decl") {
            throw new Error(`Unsupported function kind: ${f.ast.kind}`);
        }
        if (f.isMutating) {
            const nonMutName = ops.nonModifying(idText(f.ast.nativeName));
            const returns = new FuncPrettyPrinter().prettyPrintType(
                resolveFuncType(this.ctx.ctx, f.returns),
            );
            const params = this.getFunParams(f);
            const code = `
                ${returns} ${nonMutName}(${params.join(", ")}) impure ${enabledInline(this.ctx.ctx) || f.isInline ? "inline" : ""} {
            return ${funcIdOf("self")}~${idText((f.ast as AstNativeFunctionDecl).nativeName)}(${f.ast.params
                .slice(1)
                .map((arg) => funcIdOf(arg.name))
                .join(", ")});
                    }`;
            f.origin === "stdlib"
                ? this.ctx.parse(code, { context: Location.stdlib() })
                : this.ctx.parse(code);
        }
    }

    private getFunParams(f: FunctionDescription): [string, FuncAstType][] {
        const self = this.getSelf(f);
        return f.params.reduce(
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
    }

    private getSelf(f: FunctionDescription): TypeDescription | undefined {
        return f.self ? getType(this.ctx.ctx, f.self) : undefined;
    }

    /**
     * Generates Func function from the Tact funciton description.
     *
     * @return The generated function or `undefined` if no function was generated.
     */
    public writeFunction(
        f: FunctionDescription,
    ): FuncAstFunctionDefinition | never {
        let returnTy = resolveFuncType(this.ctx.ctx, f.returns);
        const self = this.getSelf(f);
        if (self !== undefined && f.isMutating) {
            // Add `self` to the method signature as it is mutating in the body.
            const selfTy = resolveFuncType(this.ctx.ctx, self);
            returnTy = Type.tensor(selfTy, returnTy);
        }

        const params: [string, FuncAstType][] = this.getFunParams(f);

        if (f.ast.kind !== "function_def") {
            throw new Error(`Unknown function kind: ${f.ast.kind}`);
        }

        // TODO: handle native functions delcs. should be in a separatre funciton

        const name = self
            ? ops.extension(self.name, f.name)
            : ops.global(f.name);

        // Prepare function attributes
        let attrs: FuncAstFunctionAttribute[] = [FunAttr.impure()];
        if (enabledInline(this.ctx.ctx) || f.isInline) {
            attrs.push(FunAttr.inline());
        }
        // TODO: handle stdlib
        // if (f.origin === "stdlib") {
        //     ctx.context("stdlib");
        // }

        // Write function body
        const body: FuncAstStatement[] = [];

        // Add arguments
        if (self) {
            const varName = resolveFuncTypeUnpack(
                this.ctx.ctx,
                self,
                funcIdOf("self"),
            );
            const init: FuncAstExpression = id(funcIdOf("self"));
            body.push(vardef("_", varName, init));
        }
        for (const a of f.ast.params) {
            if (
                !this.resolveFuncPrimitive(resolveTypeRef(this.ctx.ctx, a.type))
            ) {
                const name = resolveFuncTypeUnpack(
                    this.ctx.ctx,
                    resolveTypeRef(this.ctx.ctx, a.type),
                    funcIdOf(a.name),
                );
                const init: FuncAstExpression = id(funcIdOf(a.name));
                body.push(vardef("_", name, init));
            }
        }

        const selfName =
            self !== undefined
                ? resolveFuncTypeUnpack(this.ctx.ctx, self, funcIdOf("self"))
                : undefined;
        // Process statements
        f.ast.statements.forEach((stmt) => {
            const funcStmt = StatementGen.fromTact(
                this.ctx,
                stmt,
                selfName,
                f.returns,
            ).writeStatement();
            body.push(funcStmt);
        });

        return this.ctx.fun(attrs, name, params, returnTy, body);
    }

    /**
     * Creates a Func function that represents a constructor for the Tact struct, e.g.:
     * ```
     * ((int, int)) $MyStruct$_constructor_f1_f2(int $f1, int $f2) inline {
     *     return ($f1, $f2);
     * }
     * ```
     *
     * The generated constructor will be saved in the context.
     *
     * @param type Type description of the struct for which the constructor is generated
     * @param args Names of the arguments
     */
    public writeStructConstructor(
        type: TypeDescription,
        args: string[],
    ): FuncAstFunctionDefinition {
        const attrs: FuncAstFunctionAttribute[] = [FunAttr.inline()];
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
        const params: [string, FuncAstType][] = args.map((arg: string) => [
            avoidFunCKeywordNameClash(arg),
            resolveFuncType(
                this.ctx.ctx,
                type.fields.find((v2) => v2.name === arg)!.type,
            ),
        ]);
        // Create expressions used in actual arguments
        const values: FuncAstExpression[] = type.fields.map((v) => {
            const arg = args.find((v2) => v2 === v.name);
            if (arg) {
                return id(avoidFunCKeywordNameClash(arg));
            } else if (v.default !== undefined) {
                return LiteralGen.fromTact(this.ctx, v.default).writeValue();
            } else {
                throw Error(
                    `Missing argument for field "${v.name}" in struct "${type.name}"`,
                ); // Must not happen
            }
        });
        const body =
            values.length === 0 && returnTy.kind === "type_tuple"
                ? [ret(call("empty_tuple", []))]
                : [ret(tensor(...values))];
        const constructor = this.ctx.fun(attrs, name, params, returnTy, body);
        this.ctx.save(constructor, {
            context: Location.type(type.name),
        });
        return constructor;
    }
}
