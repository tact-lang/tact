import { ContractABI } from "@ton/core";
import { CompilerContext } from "../context";
import { PackageFileFormat } from "../packaging/fileFormat";
import { getType } from "../types/resolveDescriptors";
import { Writer } from "../utils/Writer";

export function writeReport(ctx: CompilerContext, pkg: PackageFileFormat) {
    const w = new Writer();
    const abi = JSON.parse(pkg.abi) as ContractABI;
    w.write(`
        # TACT Compilation Report
        Contract: ${pkg.name}
        BOC Size: ${Buffer.from(pkg.code, "base64").length} bytes
    `);
    w.append();

    // Types
    w.write(`# Types`);
    w.write("Total Types: " + abi.types!.length);
    w.append();
    for (const t of abi.types!) {
        const tt = getType(ctx, t.name);
        w.write(`## ${t.name}`);
        w.write(`TLB: \`${tt.tlb!}\``);
        w.write(`Signature: \`${tt.signature!}\``);
        w.append();
    }

    // Get methods
    w.write(`# Get Methods`);
    w.write("Total Get Methods: " + abi.getters!.length);
    w.append();
    for (const t of abi.getters!) {
        w.write(`## ${t.name}`);
        for (const arg of t.arguments!) {
            w.write(`Argument: ${arg.name}`);
        }
        w.append();
    }

    // Error Codes
    w.write(`# Error Codes`);
    Object.entries(abi.errors!).forEach(([t, abiError]) =>
        w.write(`${t}: ${abiError.message}`),
    );

    return w.end();
}
