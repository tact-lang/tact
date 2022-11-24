import { CompilerContext } from "../ast/context";

export type Checker = (ctx: CompilerContext) => CompilerContext;

export const allCheckers: Checker[] = [];