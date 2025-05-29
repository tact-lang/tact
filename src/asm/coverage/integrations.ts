import { join } from "path";
import { readLog } from "@/logs/parse-log";
import {
    collectAsmCoverage,
    generateShortSummary,
    generateHtml,
} from "@/asm/coverage/index";
import * as fs from "node:fs";
import { Contract } from "@ton/core";

export const calculateCoverage = async (dir: string, contract: Contract) => {
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
    }

    const logs = join(dir, "output", "log.yaml");
    const parsedLogs = await readLog(logs);

    const code = contract.init?.code;
    if (!code) {
        throw new Error("expected code in contract init, but not found");
    }

    const logsString = parsedLogs.join("\n\nNext transaction\n\n");

    const { lines, summary } = collectAsmCoverage(code, logsString);
    const shortSummary = generateShortSummary(summary);
    console.log(shortSummary);

    const report = generateHtml(lines);
    fs.writeFileSync(join(dir, `coverage-${nowTime()}.html`), report);
};

function nowTime(): string {
    const now = new Date();
    const hh = String(now.getHours()).padStart(2, "0");
    const mm = String(now.getMinutes()).padStart(2, "0");
    const ss = String(now.getSeconds()).padStart(2, "0");
    const ms = String(now.getMilliseconds()).padStart(3, "0");
    return `${hh}:${mm}:${ss}.${ms}`;
}
