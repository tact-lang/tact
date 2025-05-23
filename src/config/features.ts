import type { CompilerContext } from "@/context/context";
import { createContextStore } from "@/context/context";

const featureStore = createContextStore<boolean | null | string>();

export function enabledInline(ctx: CompilerContext) {
    return featureEnabled(ctx, "inline");
}

export function enabledDebug(ctx: CompilerContext) {
    return featureEnabled(ctx, "debug");
}

export function enabledOptimizedChildCode(ctx: CompilerContext) {
    return featureEnabled(ctx, "optimizedChildCode");
}

export function enabledExternals(ctx: CompilerContext) {
    return featureEnabled(ctx, "external");
}

export function enabledIpfsAbiGetter(ctx: CompilerContext) {
    return featureEnabled(ctx, "ipfsAbiGetter");
}

export function enabledInterfacesGetter(ctx: CompilerContext) {
    return featureEnabled(ctx, "interfacesGetter");
}

export function enabledNullChecks(ctx: CompilerContext) {
    return featureEnabled(ctx, "nullChecks");
}

export function enabledAlwaysSaveContractData(ctx: CompilerContext) {
    return featureEnabled(ctx, "alwaysSaveContractData");
}

export function enabledInternalExternalReceiversOutsideMethodsMap(
    ctx: CompilerContext,
) {
    return featureEnabled(ctx, "internalExternalReceiversOutsideMethodsMap");
}

export function enabledLazyDeploymentCompletedGetter(ctx: CompilerContext) {
    return featureEnabled(ctx, "lazyDeploymentCompletedGetter");
}

function featureEnabled(ctx: CompilerContext, key: string) {
    return featureStore.get(ctx, key) === true;
}

export function featureEnable(ctx: CompilerContext, key: string) {
    return featureStore.set(ctx, key, true);
}
