import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";

export function writeInterfaces(type: TypeDescription, ctx: WriterContext) {
    ctx.append(`_ supported_interfaces() method_id {`);
    ctx.inIndent(() => {
        ctx.append(`return (`);
        ctx.inIndent(() => {
            ctx.append(`"org.ton.introspection.v0"H >> 128,`);
            ctx.append(`"org.ton.abi.ipfs.v0"H >> 128${type.interfaces.length > 0 ? "," : ""}`);
            for (let i = 0; i < type.interfaces.length; i++) {
                ctx.append(`"org.ton.abi.ipfs.v0"H >> 128${i < type.interfaces.length - 1 ? "," : ""}`);
            }
        });
        ctx.append(`);`);
    });
    ctx.append(`}`);
    ctx.append();
}