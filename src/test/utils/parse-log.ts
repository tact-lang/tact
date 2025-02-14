/* eslint-disable @typescript-eslint/no-unnecessary-condition -- eslint bug */
import { readFile } from "fs/promises";
import { cwd } from "process";
import { parse as parseYaml } from "yaml";
import { z } from "zod";
import { parse, str, type Loc as ParserLoc } from "@tonstudio/parser-runtime";
import { relative } from "path";
import type { $ast } from "./logs";
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

export type AsmResult = AsmGas | AsmException;
export type AsmGas = {
    readonly kind: "gas";
    readonly gas: number;
};
const AsmGas = (gas: number): AsmGas => ({ kind: "gas", gas });
export type AsmException = {
    readonly kind: "exception";
    readonly no: number;
    readonly message: string;
};
const AsmException = (no: number, message: string): AsmException => ({
    kind: "exception",
    no,
    message,
});

export type Asm = {
    readonly command: string;
    readonly args: string;
    readonly location: Loc | undefined;
    readonly result: AsmResult;
};

export type Transaction = {
    readonly asm: readonly Asm[];
    readonly used: number;
    readonly debug: string | undefined;
};

export type Log = {
    readonly name: string;
    readonly transactions: readonly Transaction[];
};

export const parseLog = async (path: string): Promise<Log[]> => {
    const code = await readFile(path, "utf-8");
    const reports = packageSchema.parse(parseYaml(code));
    const result = reports.map(({ name, messages }) => {
        return {
            name,
            transactions: getTransactions(messages),
        };
    });
    const names = result.map((x) => x.name);
    if (names.length !== new Set(names).size) {
        throw new Error("Duplicate names in log");
    }
    return result;
};

export const getTransactions = (messages: readonly string[]) => {
    return pairUp(messages).flatMap(([bc, vm, bcSource, vmSource, debug]) =>
        convertPair(bc, vm, bcSource, vmSource, debug),
    );
};

const convertPair = (
    bc: $ast.BlockchainMessage,
    vm: $ast.VmMessage,
    bcSource: string,
    vmSource: string,
    debug: string | undefined,
): Transaction[] => {
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
        showErrorAtLoc(bcSource, "", bc.loc);
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
        const exceptionEntry = entry.other.find(
            (entry) => entry.$ === "VmException",
        );
        if (!commandEntry) {
            showErrorAtLoc(vmSource, "", entry.loc);
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

        if (exceptionEntry) {
            const result = AsmException(
                parseInt(exceptionEntry.errno, 10),
                exceptionEntry.message,
            );
            asm.push({ command, args, location, result });
            continue;
        }
        if (!gasEntry) {
            showErrorAtLoc(vmSource, "", entry.loc);
            continue;
        }
        const gasRemaining = parseInt(gasEntry.gas, 10);
        if (limitChanged) {
            const newLimit = parseInt(limitChanged.limit);
            const spentBefore = gasLimit - prevGas;
            const spentBeforeWithNewLimit = newLimit - spentBefore;
            const spentOnAccept = spentBeforeWithNewLimit - gasRemaining;
            prevGas = gasRemaining;
            gasLimit = newLimit;
            used2 += spentOnAccept;
            const result = AsmGas(spentOnAccept);
            asm.push({ command, args, location, result });
        } else {
            const gas = prevGas - gasRemaining;
            prevGas = gasRemaining;
            used2 += gas;
            const result = AsmGas(gas);
            asm.push({ command, args, location, result });
        }
    }

    if (used !== used2) {
        console.error("Wrong used gas!", { used, used2 });
    }

    const result = {
        asm,
        used,
        debug,
    };

    return [result];
};

const pairUp = (messages: readonly string[]) => {
    const result: [
        $ast.BlockchainMessage,
        $ast.VmMessage,
        string,
        string,
        undefined | string,
    ][] = [];
    for (let i = 0, len = messages.length; i < len; ++i) {
        const message1 = messages[i];
        if (!message1?.startsWith("[")) {
            console.error(
                `Bad blockchain log entry:\n${message1?.substring(0, 100)}`,
            );
            continue;
        }
        ++i;
        if (i >= len) {
            console.error(`Unpaired message:\n${message1?.substring(0, 100)}`);
        }
        const message2 = messages[i];
        if (!message2?.startsWith("stack")) {
            console.error(`Bad VM log entry:\n${message2?.substring(0, 100)}`);
            continue;
        }
        const bcEntry = parse({
            text: message1,
            grammar: $.BlockchainMessage,
            space: str("SPACE"),
        });
        if (bcEntry.$ === "error") {
            showError(message1, "", bcEntry.error.position);
            continue;
        }
        const vmEntry = parse({
            text: message2,
            grammar: $.VmMessage,
            space: str("SPACE"),
        });
        if (vmEntry.$ === "error") {
            showError(message2, "", vmEntry.error.position);
            continue;
        }
        if (i + 1 < messages.length) {
            const next = messages[i];
            if (next?.startsWith(debugPrefix)) {
                ++i;
                const debugMessage = next
                    .split("\n")
                    .map((line) => {
                        if (!line.startsWith(debugPrefix)) {
                            console.error(
                                "Internal: Debug line without prefix",
                            );
                        }
                        return line.substring(debugPrefix.length);
                    })
                    .join("\n");
                result.push([
                    bcEntry.value,
                    vmEntry.value,
                    message1,
                    message2,
                    debugMessage,
                ]);
                continue;
            }
        }
        result.push([
            bcEntry.value,
            vmEntry.value,
            message1,
            message2,
            undefined,
        ]);
    }
    return result;
};

const debugPrefix = "#DEBUG#: ";

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
