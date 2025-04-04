import { CompilerContext } from "@/context/context";
import { createABI } from "@/generator/createABI";
import { writeProgram } from "@/generator/writeProgram";
import type * as Ast from "@/ast/ast";
import { openContext } from "@/context/store";
import { resolveAllocations } from "@/storage/resolveAllocation";
import { featureEnable } from "@/config/features";
import { resolveDescriptors } from "@/types/resolveDescriptors";
import { resolveSignatures } from "@/types/resolveSignatures";
import { resolveStatements } from "@/types/resolveStatements";
import { evalComptimeExpressions } from "@/types/evalComptimeExpressions";
import { resolveErrors } from "@/types/resolveErrors";
import type { FactoryAst } from "@/ast/ast-helpers";

export function createContext(program: Ast.Module): CompilerContext {
    let ctx = new CompilerContext();
    ctx = openContext(
        ctx,
        /*sources=*/ [],
        /*funcSources=*/ [],
        //getParser(factoryAst),
        [program],
    );
    return ctx;
}

/**
 * Replicates the `precompile` pipeline.
 */
export function precompile(
    ctx: CompilerContext,
    factoryAst: FactoryAst,
): CompilerContext {
    ctx = resolveDescriptors(ctx, factoryAst);
    ctx = resolveStatements(ctx);
    evalComptimeExpressions(ctx, factoryAst);
    ctx = resolveSignatures(ctx, factoryAst);
    ctx = resolveErrors(ctx, factoryAst);
    ctx = resolveAllocations(ctx);
    return ctx;
}

/**
 * Enables compiler's features.
 */
export function enableFeatures(
    ctx: CompilerContext,
    ...features: ["inline" | "debug" | "masterchain" | "external"]
): CompilerContext {
    return features.reduce((accCtx, feature) => {
        return featureEnable(accCtx, feature);
    }, ctx);
}

/**
 * Replicates the `compile` pipeline.
 */
export async function compile(ctx: CompilerContext, contractName: string) {
    const abi = createABI(ctx, contractName);
    const output = await writeProgram(
        ctx,
        abi,
        `tact_check_${contractName}`,
        {}, //ContractCodes
        false,
    );
    return { output, ctx };
}
