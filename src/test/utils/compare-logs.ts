/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import { Entry, parseLog } from "./parse-log";

// yarn ts-node src/test/utils/compare-logs.ts src/test/benchmarks/jetton/output/log.txt src/test/benchmarks/jetton/output/log.txt

const main = async () => {
    const [before, after] = process.argv.slice(2);
    if (!before || !after) {
        console.error(`> yarn ts-node compare-logs <before> <after>`);
        process.exit(30);
    }

    const logsBefore = await parseLog(before);
    const beforeMap = new Map(
        logsBefore.map((log) => [log.name, log.transactions]),
    );
    const logsAfter = await parseLog(after);
    const afterMap = new Map(
        logsAfter.map((log) => [log.name, log.transactions]),
    );

    const allNames = logsBefore.map((log) => log.name);
    logsAfter.forEach((log) => {
        if (!beforeMap.has(log.name)) {
            console.error(`${log.name} didn't exist before`);
            allNames.push(log.name);
        }
    });
    allNames.forEach((name) => {
        const b = beforeMap.get(name);
        const a = afterMap.get(name);
        if (!a) {
            console.error(`${name} doesn't exist after`);
            return;
        }
        if (!b) {
            return; // impossible
        }
        matchLogs(name, b, a);
    });
};

const matchLogs = (
    name: string,
    before: readonly Entry[],
    after: readonly Entry[],
) => {
    if (before.length !== after.length) {
        console.log(`Number of transactions doesn't match`);
    }
    const minLen = Math.min(before.length, after.length);
    before.slice(0, minLen).forEach((b, i) => {
        const a = after[i];
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (!a) {
            return;
        }
        const statsBefore = getStats(b);
        const statsAfter = getStats(a);
        const allKeys = Object.keys({ ...statsBefore, ...statsAfter });
        const unorderedRows = allKeys.flatMap((k) => {
            const b = statsBefore[k];
            const a = statsAfter[k];
            const bc = b?.count ?? 0;
            const ac = a?.count ?? 0;
            const dc = bc - ac;
            if (dc === 0) {
                return [];
            }
            const bg = b?.gas ?? 0;
            const ag = a?.gas ?? 0;
            const dg = bg - ag;
            const cells = [
                k,
                "" + ac,
                "" + bc,
                formatNumber(dc),
                "" + ag,
                "" + bg,
                formatNumber(dg),
            ];
            return [[dg, cells]] as const;
        });
        const rows = unorderedRows.sort((a, b) => b[0] - a[0]).map((x) => x[1]);
        rows.unshift(header);
        const maxWidths =
            rows?.[0]?.map((_, i) =>
                rows
                    .map((x) => String(x[i]).length)
                    .reduce((a, b) => Math.max(a, b), 0),
            ) ?? [];

        const result = rows.map((r) => {
            return r
                .map((x, i) => {
                    const width = maxWidths[i] ?? 0;
                    return i === 0 ? x.padEnd(width) : x.padStart(width);
                })
                .join(" ");
        });

        console.log(`${name} #${i}`);
        console.log(result.join("\n"));
    });
};

const header = ["Instruction", "Func#", "Tact#", "Δ#", "Func$", "Tact$", "Δ$"];

const formatNumber = (s: number) => {
    return s === 0 ? "" : s > 0 ? `+${s}` : "" + s;
};

type TransactionStats = Record<string, CommandStats>;
type CommandStats = { count: number; gas: number };

const getStats = ({ asm }: Entry) => {
    const commands: TransactionStats = {};
    for (const { command, gas } of asm) {
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition -- eslint bug
        const c = (commands[command] = commands[command] || {
            count: 0,
            gas: 0,
        });
        c.count += 1;
        c.gas += gas;
    }
    return commands;
};

void main();
