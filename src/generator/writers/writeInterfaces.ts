import { getSupportedInterfaces } from "../../types/getSupportedInterfaces";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";

export function writeInterfaces(type: TypeDescription, ctx: WriterContext) {
    ctx.append(`_ supported_interfaces() method_id {`);
    ctx.inIndent(() => {
        ctx.append(`return (`);
        ctx.inIndent(() => {
            // Build interfaces list
            const interfaces: string[] = [];
            interfaces.push("org.ton.introspection.v0");
            interfaces.push(...getSupportedInterfaces(type, ctx.ctx));

            // Render interfaces
            for (let i = 0; i < interfaces.length; i++) {
                ctx.append(
                    `"${interfaces[i]}"H >> 128${i < interfaces.length - 1 ? "," : ""}`,
                );
            }
        });
        ctx.append(`);`);
    });
    ctx.append(`}`);
    ctx.append();
}
