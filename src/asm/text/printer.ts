import { Instr } from "../runtime";
import { Code, Dict } from "../runtime/util";
import { Slice } from "@ton/core";
import { printInstruction } from "./printer-gen";

export class Printer {
    public indent: number;
    public result: string;

    public constructor(indent: number) {
        this.indent = indent;
        this.result = "";
    }

    public beginLine(text: string) {
        const indentText = "    ".repeat(this.indent);
        this.result += indentText + text;
    }

    public append(text: string) {
        this.result += text;
    }

    public inIndent(action: (p: Printer) => void) {
        this.indent++;
        action(this);
        this.indent--;
    }

    public build(): string {
        return this.result;
    }
}

export const printInstr = (p: Printer, instr: Instr) => {
    if (instr.$ === "PSEUDO_PUSHREF") {
        p.beginLine("ref ");
        printCode(p, instr.arg0);
        return;
    }

    if (instr.$ === "PSEUDO_PUSHSLICE") {
        p.beginLine("embed ");
        printSlice(p, instr.arg0);
        return;
    }

    if (instr.$ === "PSEUDO_EXOTIC") {
        p.beginLine("exotic ");

        if (instr.arg0.$ === "LibraryCell") {
            p.append("library ");
            printSlice(p, instr.arg0.data);
            return;
        }

        printSlice(p, instr.arg0.cell.beginParse(true));
        return;
    }

    printInstruction(p, instr);
};

export const printInstructions = (p: Printer, instructions: Instr[]) => {
    if (instructions.length === 0) {
        p.append("{}");
        return;
    }

    p.append("{\n");
    p.inIndent((p) => {
        for (const instr of instructions) {
            printInstr(p, instr);
            p.append("\n");
        }
    });
    p.beginLine("}");
};

export const print = (instructions: Instr[]) => {
    const p = new Printer(0);
    for (const instr of instructions) {
        printInstr(p, instr);
        p.append("\n");
    }
    return p.build();
};

export function printDictionary(p: Printer, dict: Dict) {
    if (dict.$ === "RawDict") {
        printSlice(p, dict.slice);
    }

    if (dict.$ === "DecompiledDict") {
        p.append(`[\n`);

        for (const method of dict.methods) {
            p.inIndent((p) => {
                p.beginLine(`${method.id} => `);
                printInstructions(p, method.instructions);
                p.append(`\n`);
            });
        }

        p.beginLine("]");
    }
}

export function printCode(p: Printer, arg0: Code) {
    if (arg0.$ === "Instructions") {
        printInstructions(p, arg0.instructions);
    }

    if (arg0.$ === "Raw") {
        const value = arg0.slice.asCell().toString().slice(2, -1);
        if (value.includes("\n")) {
            // cell with refs
            p.append(`boc{${arg0.slice.asCell().toBoc().toString("hex")}}`);
        } else {
            p.append(`x{${value}}`);
        }
    }
}

export function printSlice(p: Printer, slice: Slice) {
    const value = slice.asCell().toString().slice(2, -1);
    if (value.includes("\n")) {
        // cell with refs
        p.append(`boc{${slice.asCell().toBoc().toString("hex")}}`);
    } else {
        p.append(`x{${value}}`);
    }
}
