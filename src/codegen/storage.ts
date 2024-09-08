import { contractErrors } from "../abi/errors";
import { enabledMasterchain } from "../config/features";
import { TypeDescription } from "../types/types";
import { WriterContext, Location } from "./context";
import { FuncPrettyPrinter } from "../func/prettyPrinter";
import { FuncAstType } from "../func/grammar";
import { funcIdOf, funcInitIdOf, ops } from "./util";
import { resolveFuncType } from "./type";

export function writeStorageOps(type: TypeDescription, ctx: WriterContext) {
    const parse = (code: string) =>
        ctx.parse(code, { context: Location.type(`${type.name}$init`) });
    const ppty = (ty: FuncAstType): string =>
        new FuncPrettyPrinter().prettyPrintType(ty);

    // Load function
    parse(`${ppty(resolveFuncType(ctx.ctx, type))} ${ops.contractLoad(type.name)}() impure {
        slice $sc = get_data().begin_parse();

        ;; Load context
        __tact_context_sys = $sc~load_ref();
        int $loaded = $sc~load_int(1);

        ;; Load data
        if ($loaded) {
            ${type.fields.length > 0 ? `return $sc~${ops.reader(type.name)}();` : `return null();`}
        } else {
            ${
                !enabledMasterchain(ctx.ctx)
                    ? `
                ;; Allow only workchain deployments
                throw_unless(${contractErrors.masterchainNotEnabled.id}, my_address().preload_uint(11) == 1024);
            `
                    : ""
            }

            ${
                type.init!.params.length > 0
                    ? `
                (${type.init!.params.map((v) => ppty(resolveFuncType(ctx.ctx, v.type)) + " " + funcIdOf(v.name)).join(", ")}) = $sc~${ops.reader(funcInitIdOf(type.name))}();
                $sc.end_parse();
            `
                    : ""
            }

            return ${ops.contractInit(type.name)}(${[...type.init!.params.map((v) => funcIdOf(v.name))].join(", ")});
        }
    }`);

    // Store function
    parse(`() ${ops.contractStore(type.name)}(${ppty(resolveFuncType(ctx.ctx, type))} v) impure inline {
        builder b = begin_cell();

        ;; Persist system cell
        b = b.store_ref(__tact_context_sys);

        ;; Persist deployment flag
        b = b.store_int(true, 1);

        ;; Build data
        ${type.fields.length > 0 ? `b = ${ops.writer(type.name)}(b, v);` : ""}

        ;; Persist data
        set_data(b.end_cell());
    }
`);
}
