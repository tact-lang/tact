/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import { readFile } from "fs/promises";
import { parse, str } from "@tonstudio/parser-runtime";
import { join, relative } from "path";
import { $ast } from "./logs";
import * as $ from "./logs";
// import { inspect } from 'util';
import { getSrcInfo } from "../../../grammar/src-info";
import { cwd } from "process";

const includeIds = true;

// const logFull = (obj: unknown) => {
//     console.log(inspect(obj, { colors: true, depth: Infinity }));
// };

type Loc = {
    readonly hash: string;
    readonly offset: string;
};

type Asm = {
    readonly command: string;
    readonly args: string;
    readonly gas: number;
    readonly location: Loc | undefined;
};

type Entry = {
    readonly path: string;
    readonly asm: readonly Asm[];
    readonly used: number;
};

const main = async () => {
    const path = join(__dirname, "output", "log.jsonl");
    const code = await readFile(path, "utf-8");
    const result = parse({
        text: code,
        grammar: $.log,
        space: str("SPACE"),
    });
    const showError = (position: number) => {
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
    if (result.$ === "error") {
        showError(result.error.position);
        process.exit(30);
    }
    const convertLog = (nodes: $ast.log, path: readonly string[]) => {
        return nodes.flatMap((node, i) =>
            convertEntry(node, [...path, ...(includeIds ? [String(i)] : [])]),
        );
    };
    const convertEntry = (node: $ast.run, path: readonly string[]): Entry[] => {
        if (node.$ === "NamedRun") {
            if (node.name.includes("ignore")) {
                return [];
            }
            return convertLog(node.log, [...path, node.name]);
        }
        const pathStr = path.join(" > ");

        let limits: $ast.BcLimits | undefined;
        let steps: $ast.BcSteps | undefined;
        for (const entry of node.bc.entries) {
            if (entry.$ === "BcEntry") {
                const info = entry.info;
                if (info.$ === "BcLimits") {
                    limits = info;
                } else if (info.$ === "BcSteps") {
                    steps = info;
                } else {
                    // vm log
                }
            }
        }
        // if (limits === undefined || steps === undefined) {
        //     // console.error("Path: " + path.join(" > "));
        //     // showError(node.bc.loc.$ === 'range' ? node.bc.loc.start : 0);
        //     return [];
        // }

        if (!steps || !limits) {
            showError(node.loc.$ === "range" ? node.loc.start : 0);
            return [];
        }

        const max = parseInt(limits.max, 10);
        const used = parseInt(steps.used, 10);
        const credit = parseInt(limits.credit, 10);
        let gasLimit = credit ? credit : Math.min(max, 1000000);
        let prevGas = gasLimit;

        if (!node.vm) {
            showError(node.loc.$ === "range" ? node.loc.start : 0);
            return [];
        }

        const asm: Asm[] = [];
        let used2 = 0;
        for (const entry of node.vm.entries) {
            const gasEntry = entry.other.find(
                (entry) => entry.$ === "VmGasRemaining",
            );
            const limitChanged = entry.other.find(
                (entry) => entry.$ === "VmLimitChanged",
            );
            const commandEntry = entry.other.find(
                (entry) => entry.$ === "VmExecute",
            );
            const locationEntry = entry.other.find(
                (entry) => entry.$ === "VmLoc",
            );
            if (!gasEntry) {
                showError(entry.loc.$ === "range" ? entry.loc.start : 0);
                continue;
            }
            if (!commandEntry) {
                showError(entry.loc.$ === "range" ? entry.loc.start : 0);
                continue;
            }
            const [cmd, argsTmp] = commandEntry.instr.split(" ", 2);
            if (!cmd) {
                throw new Error("Cannot happen");
            }
            const command = cmd === "implicit" ? commandEntry.instr : cmd;
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
                prevGas = gasRemaining;
                gasLimit = newLimit;
                used2 += spentOnAccept;
                asm.push({ command, args, gas: spentOnAccept, location });
            } else {
                const gas = prevGas - gasRemaining;
                prevGas = gasRemaining;
                used2 += gas;
                asm.push({ command, args, gas, location });
            }
        }

        if (used !== used2) {
            console.log({ path: pathStr, used, used2 });
        }

        const result = {
            path: pathStr,
            // limits,
            // steps,
            asm,
            used,
        };

        return [result];
    };

    const parsedLog = convertLog(result.value, []);

    const commands: Record<string, { count: number; gas: number }> = {};
    for (const { asm, used, path } of parsedLog) {
        if (used === 1937) continue;
        for (const { command, gas } of asm) {
            if (command === 'HASHSU') {
                console.log(path);
            }
            const c = (commands[command] = commands[command] || {
                count: 0,
                gas: 0,
            });
            c.count += 1;
            c.gas += gas;
        }
    }
    console.log(commands);
};

void main();
