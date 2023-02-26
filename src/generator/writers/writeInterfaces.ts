import { enabledDebug } from "../../config/features";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";

export function writeInterfaces(type: TypeDescription, ctx: WriterContext) {
    ctx.append(`_ supported_interfaces() method_id {`);
    ctx.inIndent(() => {
        ctx.append(`return (`);
        ctx.inIndent(() => {

            // Build interfaces list
            let interfaces: string[] = [];
            interfaces.push('org.ton.introspection.v0');
            interfaces.push('org.ton.abi.ipfs.v0');
            interfaces.push('org.ton.deploy.lazy.v0');
            if (enabledDebug(ctx.ctx)) {
                interfaces.push('org.ton.debug.v0');
            }
            for (let i = 0; i < type.interfaces.length; i++) {
                interfaces.push(type.interfaces[i]);
            }

            // Render interfaces
            for (let i = 0; i < interfaces.length; i++) {
                ctx.append(`"${interfaces[i]}"H >> 128${i < interfaces.length - 1 ? "," : ""}`);
            }
        });
        ctx.append(`);`);
    });
    ctx.append(`}`);
    ctx.append();
}