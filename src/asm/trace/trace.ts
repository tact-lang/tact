import { InstructionInfo, Loc, MappingInfo } from "./mapping";
import { LogEntry, StackElement, parseLogs } from "./logs";
import { FuncSourceLoc, FuncMapping } from "./func-mapping";

/**
 * Describes a single step in the trace.
 */
export type Step = {
    readonly loc: Loc | undefined;
    readonly instructionName: string;
    readonly stack: readonly StackElement[];
    readonly gas: number;
    readonly gasCost: number;
    readonly funcLoc: undefined | FuncSourceLoc;
};

/**
 * Describes the entire trace.
 */
export type TraceInfo = {
    readonly steps: readonly Step[];
};

/**
 * Creates a trace from the logs and mapping.
 */
export const createTraceInfo = (
    logs: string,
    mapping: MappingInfo,
    funcMapping: undefined | FuncMapping,
): TraceInfo => {
    const stepLogInfo = parseLogs(logs).flat();

    const steps = stepLogInfo.flatMap((stepInfo): readonly Step[] => {
        // TODO: handle JMPREF and first ref instruction with offset 0
        const res = findInstructionInfo(mapping, stepInfo);
        if (!res) {
            // skip for simplicity for now
            return [];
        }

        const [instructions, index] = res;
        const instr = instructions[index];
        if (!instr) return [];

        const funcLoc =
            instr.debugSection !== -1 && funcMapping
                ? funcMapping.locations[instr.debugSection]
                : undefined;

        return [
            {
                loc: instr.loc,
                instructionName: instr.name,
                stack: stepInfo.stack,
                gas: stepInfo.gas,
                gasCost: stepInfo.gasCost,
                funcLoc,
            },
        ];
    });

    return { steps };
};

export const createTraceInfoPerTransaction = (
    logs: string,
    mapping: MappingInfo,
    funcMapping: undefined | FuncMapping,
): TraceInfo[] => {
    const transactionLogs = parseLogs(logs);

    return transactionLogs.map((transactionLog): TraceInfo => {
        const steps: Step[] = [];

        // handle cases where we have two instructions with offset 0
        // like JMPREF and the first instruction in the ref
        let offsetZeroCount = 0;

        for (const stepInfo of transactionLog) {
            const res = findInstructionInfo(mapping, stepInfo);
            if (!res) {
                // skip for simplicity for now
                continue;
            }

            if (stepInfo.offset !== 0 && offsetZeroCount !== 0) {
                // if we found an instruction with a non-zero offset,
                // we reset the offsetZeroCount to correctly handle it
                offsetZeroCount = 0;
            }

            const [instructions, index] = res;
            const instr = instructions[index + offsetZeroCount];
            if (!instr) continue;

            if (stepInfo.offset === 0 && offsetZeroCount === 0) {
                // if we handled the first instruction with offset 0,
                // on the next step we will handle the second one
                offsetZeroCount = 1;
            }

            const funcLoc =
                instr.debugSection !== -1 && funcMapping
                    ? funcMapping.locations[instr.debugSection]
                    : undefined;

            steps.push({
                loc: instr.loc,
                instructionName: instr.name,
                stack: stepInfo.stack,
                gas: stepInfo.gas,
                gasCost: stepInfo.gasCost,
                funcLoc: funcLoc,
            });
        }

        return { steps };
    });
};

/**
 * Finds the instruction in the mapping.
 */
const findInstructionInfo = (
    info: MappingInfo,
    stepInfo: LogEntry,
): undefined | [readonly InstructionInfo[], number] => {
    // Cell hash can be both Dictionary Cell hash or just a regular code Cell hash
    const hash = stepInfo.hash;

    // We try to find the Dictionary Cell in the mapping
    const dictCell = info.dictionaryCells.find((it) => it.cell === hash);

    // And if we found it, we use not Dictionary Cell hash,
    // but the data Cell hash that we stored in the mapping
    const [targetCellHash, offset] = dictCell
        ? [dictCell.dataCell, dictCell.offset]
        : [hash, 0];

    const cell = info.cells[targetCellHash];
    if (!cell) {
        // no luck, we don't have this cell in the mapping
        return undefined;
    }

    // Important note that we need to shift the step offset that we have in the log
    // since in the code Cell we start from the 0, while in logs it starts from the offset
    // of the code Cell in the Dictionary Cell
    return [
        cell.instructions,
        cell.instructions.findIndex(
            (it) => it.offset === stepInfo.offset - offset,
        ),
    ];
};
