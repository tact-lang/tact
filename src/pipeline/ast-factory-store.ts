import { createContextStore, type CompilerContext } from "@/context/context";
import type { FactoryAst } from "@/ast/ast-helpers";

import { throwInternalCompilerError } from "@/error/errors";

const astFactoryStore = createContextStore<FactoryAst>();
const dummyFactoryStoreKey = "dummyFactoryStoreKey";

export const setAstFactoryToStore = (ctx: CompilerContext, ast: FactoryAst) => {
    astFactoryStore.set(ctx, dummyFactoryStoreKey, ast);
};

export const getAstFactoryFromStore = (ctx: CompilerContext): FactoryAst => {
    const factory = astFactoryStore.get(ctx, dummyFactoryStoreKey);
    if (factory === null) {
        throwInternalCompilerError("Ast factory store was not set");
    }
    return factory;
};
