import { CompilerContext, enabled } from "./context";

export function enabledInline(ctx: CompilerContext) {
    return enabled(ctx, 'inline');
}

export function enabledDebug(ctx: CompilerContext) {
    return enabled(ctx, 'debug');
}