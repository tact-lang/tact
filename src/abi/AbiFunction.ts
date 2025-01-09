import { AstExpression } from "../050-grammar/ast";
import { CompilerContext } from "../010-pipeline/context";
import { WriterContext } from "../generator/Writer";
import { TypeRef } from "../060-types/types";
import { SrcInfo } from "../050-grammar";

export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: TypeRef[], loc: SrcInfo) => TypeRef;
    generate: (
        ctx: WriterContext,
        args: TypeRef[],
        resolved: AstExpression[],
        loc: SrcInfo,
    ) => string;
};
