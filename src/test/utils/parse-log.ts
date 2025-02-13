/* eslint-disable @typescript-eslint/no-unnecessary-condition -- eslint bug */
import { readFile } from "fs/promises";
import { cwd } from "process";
import { parse as parseYaml } from "yaml";
import { z } from "zod";
import { parse, str, Loc as ParserLoc } from "@tonstudio/parser-runtime";
import { relative } from "path";
import { $ast } from "./logs";
import * as $ from "./logs";
import { getSrcInfo } from "../../grammar/src-info";

const packageSchema = z.array(
    z.object({
        name: z.string(),
        messages: z.array(z.string()),
    }),
);

export type Loc = {
    readonly hash: string;
    readonly offset: string;
};

export type Asm = {
    readonly command: string;
    readonly args: string;
    readonly gas: number;
    readonly location: Loc | undefined;
};

export type Entry = {
    readonly asm: readonly Asm[];
    readonly used: number;
};

export type Log = {
    readonly name: string;
    readonly transactions: readonly Entry[];
};

export const parseLog = async (path: string): Promise<Log[]> => {
    const code = await readFile(path, "utf-8");
    const reports = packageSchema.parse(parseYaml(code));
    const result = reports.map(({ name, messages }) => {
        return {
            name,
            transactions: pairUp(path, name, messages).flatMap(([bc, vm]) =>
                convert(bc, vm),
            ),
        };
    });
    const names = result.map((x) => x.name);
    if (names.length !== new Set(names).size) {
        throw new Error("Duplicate names in log");
    }
    return result;
};

const convert = (bc: $ast.BlockchainMessage, vm: $ast.VmMessage): Entry[] => {
    let limits: $ast.BcLimits | undefined;
    let steps: $ast.BcSteps | undefined;
    for (const entry of bc.entries) {
        if (entry.$ === "BcEntry") {
            const info = entry.info;
            if (info.$ === "BcLimits") {
                limits = info;
            } else if (info.$ === "BcSteps") {
                steps = info;
            }
        }
    }
    if (limits === undefined || steps === undefined) {
        showErrorAtLoc("", "", bc.loc);
        return [];
    }
    const max = parseInt(limits.limit, 10);
    const used = parseInt(steps.used, 10);
    const credit = parseInt(limits.credit, 10);
    let gasLimit = credit ? credit : Math.min(max, 1000000);
    let prevGas = gasLimit;

    const asm: Asm[] = [];
    let used2 = 0;
    for (const entry of vm.entries) {
        const gasEntry = entry.other.find(
            (entry) => entry.$ === "VmGasRemaining",
        );
        const limitChanged = entry.other.find(
            (entry) => entry.$ === "VmLimitChanged",
        );
        const commandEntry = entry.other.find(
            (entry) => entry.$ === "VmExecute",
        );
        const locationEntry = entry.other.find((entry) => entry.$ === "VmLoc");
        if (!gasEntry) {
            showErrorAtLoc("", "", entry.loc);
            continue;
        }
        if (!commandEntry) {
            showErrorAtLoc("", "", entry.loc);
            continue;
        }
        const [cmd, argsTmp] = commandEntry.instr.split(" ", 2);
        if (!cmd) {
            throw new Error("Cannot happen");
        }
        const command = cmd === "implicit" ? commandEntry.instr : cmd;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition -- eslint bug
        const args = cmd === "implicit" ? "" : (argsTmp ?? "");
        const location = locationEntry
            ? {
                  hash: locationEntry.hash,
                  offset: locationEntry.offset,
              }
            : undefined;
        const gasRemaining = parseInt(gasEntry.gas, 10);
        if (limitChanged) {
            const newLimit = parseInt(limitChanged.limit);
            const spentBefore = gasLimit - prevGas;
            const spentBeforeWithNewLimit = newLimit - spentBefore;
            const spentOnAccept = spentBeforeWithNewLimit - gasRemaining;
            if (spentOnAccept > 1000) debugger;
            prevGas = gasRemaining;
            gasLimit = newLimit;
            used2 += spentOnAccept;
            asm.push({ command, args, gas: spentOnAccept, location });
        } else {
            const gas = prevGas - gasRemaining;
            if (gas > 1000) debugger;
            prevGas = gasRemaining;
            used2 += gas;
            asm.push({ command, args, gas, location });
        }
    }

    if (used !== used2) {
        console.error("Wrong used gas!", { used, used2 });
    }

    const result = {
        asm,
        used,
    };

    return [result];
};

const pairUp = (path: string, name: string, messages: readonly string[]) => {
    const result: [$ast.BlockchainMessage, $ast.VmMessage][] = [];
    for (let i = 0, len = messages.length; i < len; ++i) {
        const message1 = messages[i];
        if (!message1?.startsWith("[")) {
            console.error(
                `Bad blockchain log entry for ${name}:\n${message1?.substring(0, 100)}`,
            );
            continue;
        }
        ++i;
        if (i >= len) {
            console.error(
                `Unpaired message for ${name}:\n${message1?.substring(0, 100)}`,
            );
        }
        const message2 = messages[i];
        if (!message2?.startsWith("stack")) {
            console.error(
                `Bad VM log entry for ${name}:\n${message2?.substring(0, 100)}`,
            );
            continue;
        }
        const bcEntry = parse({
            text: message1,
            grammar: $.BlockchainMessage,
            space: str("SPACE"),
        });
        if (bcEntry.$ === "error") {
            showError(message1, path, bcEntry.error.position);
            continue;
        }
        const vmEntry = parse({
            text: message2,
            grammar: $.VmMessage,
            space: str("SPACE"),
        });
        if (vmEntry.$ === "error") {
            showError(message1, path, vmEntry.error.position);
            continue;
        }
        result.push([bcEntry.value, vmEntry.value]);
    }
    return result;
};

const showErrorAtLoc = (code: string, path: string, loc: ParserLoc) => {
    showError(code, path, loc.$ === "range" ? loc.start : loc.at);
};
const showError = (code: string, path: string, position: number) => {
    console.log(
        getSrcInfo(
            code,
            position,
            position,
            relative(cwd(), path),
            "user",
        ).interval.getLineAndColumnMessage(),
    );
};

// const parseReport = (name: string, messages: readonly string[]) => {
//     const convertLog = (nodes: $ast.log, path: readonly string[]) => {
//         return nodes.flatMap((node, i) =>
//             // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition -- eslint bug
//             convertEntry(node, [...path, ...(includeIds ? [String(i)] : [])]),
//         );
//     };

//     const convertEntry = (node: $ast.run, path: readonly string[]): Entry[] => {
//         if (node.$ === "NamedRun") {
//             if (node.name.includes("ignore")) {
//                 return [];
//             }
//             return convertLog(node.log, [...path, node.name]);
//         }
//         const pathStr = path.join(" > ");

//     };

//     return convertLog(result.value, []);
// };
