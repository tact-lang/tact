import { ContractABI } from "@ton/core";
import { CompilerContext } from "../context";
import { PackageFileFormat } from "../packaging/fileFormat";
import { getType } from "../types/resolveDescriptors";
import { Writer } from "../utils/Writer";
import { TypeDescription } from "../types/types";

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
        const tt = getType(
            ctx,
            t.name.endsWith("$Data") ? t.name.slice(0, -5) : t.name,
        );
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
    Object.entries(abi.errors!).forEach(([t, abiError]) => {
        w.write(`${t}: ${abiError.message}`);
    });
    w.append();

    const t = getType(ctx, pkg.name);
    const writtenEdges: Set<string> = new Set();

    // Trait Inheritance Diagram
    w.write(`# Trait Inheritance Diagram`);
    w.append();
    w.write("```mermaid");
    w.write("graph TD");
    function writeTraits(t: TypeDescription) {
        for (const trait of t.traits) {
            const edge = `${t.name} --> ${trait.name}`;
            if (writtenEdges.has(edge)) {
                continue;
            }
            writtenEdges.add(edge);
            w.write(edge);
            writeTraits(trait);
        }
    }
    w.write(t.name);
    writeTraits(t);
    w.write("```");
    w.append();

    writtenEdges.clear();

    // Contract Dependency Diagram
    w.write(`# Contract Dependency Diagram`);
    w.append();
    w.write("```mermaid");
    w.write("graph TD");
    function writeDependencies(t: TypeDescription) {
        for (const dep of t.dependsOn) {
            const edge = `${t.name} --> ${dep.name}`;
            if (writtenEdges.has(edge)) {
                continue;
            }
            writtenEdges.add(edge);
            w.write(edge);
            writeDependencies(dep);
        }
    }
    writtenEdges.clear();
    w.write(t.name);
    writeDependencies(t);
    w.write("```");

    return w.end();
}
