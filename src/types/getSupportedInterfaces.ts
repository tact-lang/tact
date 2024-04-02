import { enabledDebug, enabledMasterchain } from "../config/features";
import { CompilerContext } from "../context";
import { TypeDescription } from "./types";

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
    if (!enabledMasterchain(ctx)) {
        interfaces.push("org.ton.chain.workchain.v0");
    } else {
        interfaces.push("org.ton.chain.any.v0");
    }
    for (let i = 0; i < type.interfaces.length; i++) {
        interfaces.push(type.interfaces[i]);
    }
    return interfaces;
}
