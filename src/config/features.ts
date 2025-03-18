import type { CompilerContext } from "../context/context";
import { createContextStore } from "../context/context";
import { throwInternal } from "../error/errors";

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

export function internalExternalReceiversOutsideMethodsMapMode(
    ctx: CompilerContext,
): "disable" | "explorers-compatible" | "fast" {
    const featureMode = featureStore.get(
        ctx,
        "internalExternalReceiversOutsideMethodsMap",
    );
    if (typeof featureMode !== "string") {
        return throwInternal(
            "Expected, that internalExternalReceiversOutsideMethodsMap is a string but got: " +
                featureMode,
        );
    }
    else if (
        featureMode !== "disable" &&
        featureMode !== "explorers-compatible" &&
        featureMode !== "fast"
    ) {
        return throwInternal(
            "Expected, that internalExternalReceiversOutsideMethodsMap is one of 'disable', 'explorers-compatible', 'fast' but got: " +
                featureMode,
        );
    }
    else {
        return featureMode;
    }
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

export function featureSet(ctx: CompilerContext, key: string, value: boolean | string) {
    return featureStore.set(ctx, key, value);
}
