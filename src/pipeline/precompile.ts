import { CompilerContext } from "../context/context";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../context/store";
import { resolveStatements } from "../types/resolveStatements";
import { resolveErrors } from "../types/resolveErrors";
import { resolveSignatures } from "../types/resolveSignatures";
import { resolveImports } from "../imports/resolveImports";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { AstModule } from "../ast/ast";
import { FactoryAst } from "../ast/ast-helpers";
import { Parser } from "../grammar";
import { evalComptimeExpressions } from "../types/evalInitializers";

export function precompile(
    ctx: CompilerContext,
    project: VirtualFileSystem,
    stdlib: VirtualFileSystem,
    entrypoint: string,
    parser: Parser,
    ast: FactoryAst,
    parsedModules?: AstModule[],
) {
    // Load all sources
    const imported = resolveImports({ entrypoint, project, stdlib, parser });

    // Add information about all the source code entries to the context
    ctx = openContext(ctx, imported.tact, imported.func, parser, parsedModules);

    // First load type descriptors and check that
    //       they all have valid signatures
    ctx = resolveDescriptors(ctx, ast);

    // This creates TLB-style type definitions
    ctx = resolveSignatures(ctx, ast);

    // This checks and resolves all statements
    ctx = resolveStatements(ctx);

    // This extracts error messages
    ctx = resolveErrors(ctx, ast);

    // This creates allocations for all defined types
    ctx = resolveAllocations(ctx);

    // Evaluate all comp-time expressions:
    // constants, default contract fields, default struct fields, method Ids
    evalComptimeExpressions(ctx, ast);

    // Prepared context
    return ctx;
}
