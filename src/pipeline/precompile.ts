import { CompilerContext } from "../context";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../grammar/store";
import { resolveStatements } from "../types/resolveStatements";
import { resolveErrors } from "../types/resolveErrors";
import { resolveSignatures } from "../types/resolveSignatures";
import { resolveImports } from "../imports/resolveImports";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";

export function precompile(
    ctx: CompilerContext,
    project: VirtualFileSystem,
    stdlib: VirtualFileSystem,
    entrypoint: string,
) {
    // Load all sources
    const imported = resolveImports({ entrypoint, project, stdlib });

    // Add information about all the source code entries to the context
    ctx = openContext(ctx, imported.tact, imported.func);

    // First load type descriptors and check that
    //       they all have valid signatures
    ctx = resolveDescriptors(ctx);

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
