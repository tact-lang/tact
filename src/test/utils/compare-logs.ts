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
        console.log(`## ${name} #${i}`);
        
        const a = after[i];
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (!a) {
            return;
        }
        const statsBefore = getStats(b);
        const statsAfter = getStats(a);
        const allKeys = Object.keys({ ...statsBefore, ...statsAfter });
        let computedDelta = 0;
        const totals = {
            beforeCount: 0,
            afterCount: 0,
            deltaCount: 0,
            beforeGas: 0,
            afterGas: 0,
            deltaGas: 0,
        };
        const unorderedRows = allKeys.flatMap((k) => {
            const b = statsBefore[k];
            const a = statsAfter[k];
            const bc = b?.count ?? 0;
            totals.beforeCount += bc;
            const ac = a?.count ?? 0;
            totals.afterCount += ac;
            const dc = ac - bc;
            totals.deltaCount += dc;
            const bg = b?.gas ?? 0;
            totals.beforeGas += bg;
            const ag = a?.gas ?? 0;
            totals.afterGas += ag;
            const dg = ag - bg;
            totals.deltaGas += dg;
            computedDelta += dg;
            if (dc === 0 && dg === 0) {
                return [];
            }
            const cells = [
                '`' + k + '`',
                "" + bc,
                "" + ac,
                formatNumber(dc),
                "" + bg,
                "" + ag,
                formatNumber(dg),
            ];
            return [[dg, cells]] as const;
        });
        const actualDelta = a.used - b.used;
        if (computedDelta !== actualDelta) {
            console.error(`Internal error: total gas delta does not match: ${computedDelta} vs ${actualDelta}`);
        }
        if (unorderedRows.length === 0) {
            console.log('No diff');
            console.log('');
            return;
        }
        const rows = unorderedRows.sort((a, b) => b[0] - a[0]).map((x) => x[1]);
        rows.unshift([
            'Total', 
            String(totals.beforeCount),
            String(totals.afterCount),
            formatNumber(totals.deltaCount),
            String(totals.beforeGas),
            String(totals.afterGas),
            formatNumber(totals.deltaGas),
        ]);
        rows.unshift(header);
        const maxWidths =
            rows?.[0]?.map((_, i) =>
                rows
                    .map((x) => String(x[i]).length)
                    .reduce((a, b) => Math.max(a, b), 0),
            ) ?? [];
        const result = rows.map((r) => {
            const rowText = r
                .map((x, i) => {
                    const width = maxWidths[i] ?? 0;
                    return i === 0 ? x.padEnd(width) : x.padStart(width);
                })
                .join(" | ");
            return `| ${rowText} |`;
        });
        result.splice(1, 0, `| ${rows?.[0]?.map((_, i) => '-'.repeat(maxWidths[i] ?? 0) + (i === 0 ? ' ' : ':')).join('| ')}|`)

        console.log(result.join("\n"));
        console.log('');
    });
};

const header = ["Instruction", "Before#", "After#", "Δ#", "Before$", "After$", "Δ$"];

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
