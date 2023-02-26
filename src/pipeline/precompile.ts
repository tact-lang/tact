import { CompilerContext } from "../context";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../grammar/store";
import { resolveStatements } from "../types/resolveStatements";
import { resolveStrings } from "../types/resolveStrings";
import { resolveSignatures } from '../types/resolveSignatures';
import { resolveImports } from '../imports/resolveImports';
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";

export function precompile(ctx: CompilerContext, project: VirtualFileSystem, stdlib: VirtualFileSystem, entrypoint: string) {

    // Load all sources
    let imported = resolveImports({ entrypoint, project, stdlib });

    // Perform initial compiler steps
    ctx = openContext(ctx, imported.tact, imported.func);
    ctx = resolveDescriptors(ctx);
    ctx = resolveSignatures(ctx);
    ctx = resolveAllocations(ctx);
    ctx = resolveStrings(ctx);
    ctx = resolveStatements(ctx);

    // Prepared context
    return ctx;
}