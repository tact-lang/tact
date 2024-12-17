import { CompilerContext } from "../context";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../grammar/store";
import { resolveStatements } from "../types/resolveStatements";
import { resolveErrors } from "../types/resolveErrors";
import { resolveSignatures } from "../types/resolveSignatures";
import { resolveImports } from "../imports/resolveImports";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { AstModule, AstSchema } from "../grammar/ast";
import { Parser } from "../grammar/prev";

export function precompile(
    ctx: CompilerContext,
    project: VirtualFileSystem,
    stdlib: VirtualFileSystem,
    entrypoint: string,
    parser: Parser,
    ast: AstSchema,
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
    ctx = resolveSignatures(ctx);

    // This creates allocations for all defined types
    ctx = resolveAllocations(ctx);

    // This checks and resolves all statements
    ctx = resolveStatements(ctx);

    // This extracts error messages
    ctx = resolveErrors(ctx);

    // Prepared context
    return ctx;
}
