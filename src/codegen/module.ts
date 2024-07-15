import { getAllTypes } from "../types/resolveDescriptors";
import { TypeDescription } from "../types/types";
import { getSortedTypes } from "../storage/resolveAllocation";
import { FuncAstModule } from "../func/syntax";
import { makeComment, makeModule } from "../func/syntaxUtils";
import { FunctionGen, CodegenContext } from ".";

/**
 * Encapsulates generation of the main Func compilation module from the main Tact module.
 */
export class ModuleGen {
    private constructor(
        private ctx: CodegenContext,
        private contractName: string,
    ) {}

    static fromTact(
        ctx: CodegenContext,
        contractName: string,
    ): ModuleGen {
        return new ModuleGen(ctx, contractName);
    }

    /**
     * Adds stdlib definitions to the generated module.
     */
    private addStdlib(m: FuncAstModule): void {
        // TODO
    }

    private addSerializers(m: FuncAstModule): void {
        const sortedTypes = getSortedTypes(this.ctx.ctx);
        for (const t of sortedTypes) {
        }
    }

    private addAccessors(m: FuncAstModule): void {
        // TODO
    }

    private addInitSerializer(m: FuncAstModule): void {
        // TODO
    }

    private addStorageFunctions(m: FuncAstModule): void {
        // TODO
    }

    private addStaticFunctions(m: FuncAstModule): void {
        // TODO
    }

    private addExtensions(m: FuncAstModule): void {
        // TODO
    }

    /**
     * Adds functions defined within the Tact contract to the generated Func module.
     * TODO: Why do we need function from *all* the contracts?
     */
    private addContractFunctions(m: FuncAstModule, c: TypeDescription): void {
        m.entries.push(makeComment("", `Contract ${c.name} functions`, ""));

        for (const tactFun of c.functions.values()) {
            const funcFun = FunctionGen.fromTact(this.ctx).writeFunction(
                tactFun,
            );
            m.entries.push(funcFun);
        }
    }

    /**
     * Adds entries from the main Tact contract.
     */
    private addMainContract(m: FuncAstModule, c: TypeDescription): void {
        // XXX see: writeMainContract
        m.entries.push(
            makeComment("", `Receivers of a Contract ${c.name}`, ""),
        );

        // // Write receivers
        // for (const r of Object.values(c.receivers)) {
        //     this.writeReceiver(type, r, ctx);
        // }

        m.entries.push(
            makeComment("", `Get methods of a Contract ${c.name}`, ""),
        );

        // // Getters
        // for (const f of type.functions.values()) {
        //     if (f.isGetter) {
        //         writeGetter(f, ctx);
        //     }
        // }

        // // Interfaces
        // writeInterfaces(type, ctx);

        // // ABI
        // ctx.append(`_ get_abi_ipfs() method_id {`);
        // ctx.inIndent(() => {
        //     ctx.append(`return "${abiLink}";`);
        // });
        // ctx.append(`}`);
        // ctx.append();

        // // Deployed
        // ctx.append(`_ lazy_deployment_completed() method_id {`);
        // ctx.inIndent(() => {
        //     ctx.append(`return get_data().begin_parse().load_int(1);`);
        // });
        // ctx.append(`}`);
        // ctx.append();

        // Comments
        m.entries.push(makeComment("", `Routing of a Contract ${c.name}`, ""));

        // // Render body
        // const hasExternal = type.receivers.find((v) =>
        //     v.selector.kind.startsWith("external-"),
        // );
        // writeRouter(type, "internal", ctx);
        // if (hasExternal) {
        //     writeRouter(type, "external", ctx);
        // }

        // // Render internal receiver
        // ctx.append(
        //     `() recv_internal(int msg_value, cell in_msg_cell, slice in_msg) impure {`,
        // );
        // ctx.inIndent(() => {
        //     // Load context
        //     ctx.append();
        //     ctx.append(`;; Context`);
        //     ctx.append(`var cs = in_msg_cell.begin_parse();`);
        //     ctx.append(`var msg_flags = cs~load_uint(4);`); // int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
        //     ctx.append(`var msg_bounced = -(msg_flags & 1);`);
        //     ctx.append(
        //         `slice msg_sender_addr = ${ctx.used("__tact_verify_address")}(cs~load_msg_addr());`,
        //     );
        //     ctx.append(
        //         `__tact_context = (msg_bounced, msg_sender_addr, msg_value, cs);`,
        //     );
        //     ctx.append(`__tact_context_sender = msg_sender_addr;`);
        //     ctx.append();
        //
        //     // Load self
        //     ctx.append(`;; Load contract data`);
        //     ctx.append(`var self = ${ops.contractLoad(type.name, ctx)}();`);
        //     ctx.append();
        //
        //     // Process operation
        //     ctx.append(`;; Handle operation`);
        //     ctx.append(
        //         `int handled = self~${ops.contractRouter(type.name, "internal")}(msg_bounced, in_msg);`,
        //     );
        //     ctx.append();
        //
        //     // Throw if not handled
        //     ctx.append(`;; Throw if not handled`);
        //     ctx.append(
        //         `throw_unless(${contractErrors.invalidMessage.id}, handled);`,
        //     );
        //     ctx.append();
        //
        //     // Persist state
        //     ctx.append(`;; Persist state`);
        //     ctx.append(`${ops.contractStore(type.name, ctx)}(self);`);
        // });
        // ctx.append("}");
        // ctx.append();
        //
        //     // Render external receiver
        //     if (hasExternal) {
        //         ctx.append(`() recv_external(slice in_msg) impure {`);
        //         ctx.inIndent(() => {
        //             // Load self
        //             ctx.append(`;; Load contract data`);
        //             ctx.append(`var self = ${ops.contractLoad(type.name, ctx)}();`);
        //             ctx.append();
        //
        //             // Process operation
        //             ctx.append(`;; Handle operation`);
        //             ctx.append(
        //                 `int handled = self~${ops.contractRouter(type.name, "external")}(in_msg);`,
        //             );
        //             ctx.append();
        //
        //             // Throw if not handled
        //             ctx.append(`;; Throw if not handled`);
        //             ctx.append(
        //                 `throw_unless(handled, ${contractErrors.invalidMessage.id});`,
        //             );
        //             ctx.append();
        //
        //             // Persist state
        //             ctx.append(`;; Persist state`);
        //             ctx.append(`${ops.contractStore(type.name, ctx)}(self);`);
        //         });
        //         ctx.append("}");
        //         ctx.append();
        //     }
        // });
    }

    public writeAll(): FuncAstModule {
        const m: FuncAstModule = makeModule();

        const allTypes = Object.values(getAllTypes(this.ctx.ctx));
        const contracts = allTypes.filter((v) => v.kind === "contract");
        const contract = contracts.find((v) => v.name === this.contractName);
        if (contract === undefined) {
            throw Error(`Contract "${this.contractName}" not found`);
        }

        this.addStdlib(m);
        this.addSerializers(m);
        this.addAccessors(m);
        this.addInitSerializer(m);
        this.addStorageFunctions(m);
        this.addStaticFunctions(m);
        this.addExtensions(m);
        contracts.forEach((c) => this.addContractFunctions(m, c));
        this.addMainContract(m, contract);

        return m;
    }
}
