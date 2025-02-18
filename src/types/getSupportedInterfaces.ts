import { enabledDebug } from "../config/features";
import type { CompilerContext } from "../context/context";
import type { TypeDescription } from "./types";

export function getSupportedInterfaces(
    type: TypeDescription,
    ctx: CompilerContext,
) {
    const interfaces: string[] = [];
    interfaces.push("org.ton.abi.ipfs.v0");
    interfaces.push("org.ton.deploy.lazy.v0");
    if (enabledDebug(ctx)) {
        interfaces.push("org.ton.debug.v0");
    }
    type.interfaces.forEach((iface) => interfaces.push(iface));
    return interfaces;
}
