import { CodegenContext, FunctionGen } from ".";
import { FuncAstExpr } from "../func/syntax";
import { Address, beginCell, Cell } from "@ton/core";
import { Value } from "../types/types";
import {
    call,
    Type,
    number,
    id,
    asmfun,
    nil,
    bool,
} from "../func/syntaxConstructors";
import { getType } from "../types/resolveDescriptors";

import JSONbig from "json-bigint";

/**
 * Encapsulates generation of Func literal values from Tact values.
 */
export class LiteralGen {
    /**
     * @param tactExpr Expression to translate.
     */
    private constructor(
        private ctx: CodegenContext,
        private tactValue: Value,
    ) {}

    static fromTact(ctx: CodegenContext, tactValue: Value): LiteralGen {
        return new LiteralGen(ctx, tactValue);
    }

    /**
     * Saves/retrieves a function from the context and returns its name.
     */
    private writeRawSlice(
        prefix: string,
        comment: string,
        cell: Cell,
    ): FuncAstExpr {
        const h = cell.hash().toString("hex");
        const t = cell.toBoc({ idx: false }).toString("hex");
        const funName = `__gen_slice_${prefix}_${h}`;
        if (!this.ctx.has("function", funName)) {
            // TODO: Add docstring: `comment`
            const fun = asmfun(
                [],
                funName,
                [],
                Type.slice(),
                `{${t}} B>boc <s PUSHSLICE`,
            );
            this.ctx.add("function", fun);
        }
        return id(funName);
    }

    /**
     * Returns a function name used to access the string value.
     */
    private writeString(str: string): FuncAstExpr {
        const cell = beginCell().storeStringTail(str).endCell();
        return this.writeRawSlice("string", `String "${str}"`, cell);
    }

    /**
     * Returns a function name used to access the address value.
     */
private writeAddress(address: Address) {
    return this.writeRawSlice(
        "address",
        address.toString(),
        beginCell().storeAddress(address).endCell(),
    );
}

    /**
     * Generates FunC literals from Tact ones.
     */
    public writeValue(): FuncAstExpr {
        const val = this.tactValue;
        if (typeof val === "bigint") {
            return number(val);
        }
        if (typeof val === "string") {
            return call(this.writeString(val), []);
        }
        if (typeof val === "boolean") {
            return bool(val);
        }
        if (Address.isAddress(val)) {
            return call(this.writeAddress(val), [])
        }
        // if (val instanceof Cell) {
        //     const res = writeCell(val, wCtx);
        //     wCtx.used(res);
        //     return `${res}()`;
        // }
        if (val === null) {
            return nil();
        }
        // if (val instanceof CommentValue) {
        //     const id = writeComment(val.comment, wCtx);
        //     wCtx.used(id);
        //     return `${id}()`;
        // }
        if (typeof val === "object" && "$tactStruct" in val) {
            // this is a struct value
            const structDescription = getType(
                this.ctx.ctx,
                val["$tactStruct"] as string,
            );
            const fields = structDescription.fields.map((field) => field.name);
            const constructor = FunctionGen.fromTact(
                this.ctx,
            ).writeStructConstructor(structDescription, fields);
            this.ctx.add("function", constructor);
            const fieldValues = structDescription.fields.map((field) => {
                if (field.name in val) {
                    return this.makeValue(val[field.name]!);
                } else {
                    throw Error(
                        `Struct value is missing a field: ${field.name}`,
                        val,
                    );
                }
            });
            return call(constructor.name, fieldValues);
        }
        throw Error(`Invalid value: ${JSONbig.stringify(val, null, 2)}`);
    }

    private makeValue(val: Value): FuncAstExpr {
        return LiteralGen.fromTact(this.ctx, val).writeValue();
    }
}
