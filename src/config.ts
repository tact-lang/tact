import { CompilerContext, enabled } from "./context";

export function enabledInline(ctx: CompilerContext) {
    return enabled(ctx, 'inline');
} 