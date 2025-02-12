/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import { basename, dirname, extname, join } from "path";
import { createVirtualFileSystem } from "../../../vfs/createVirtualFileSystem";
import { createNodeFileSystem } from "../../../vfs/createNodeFileSystem";
import { Logger, LogLevel } from "../../../context/logger";
import { run } from "../../../cli/tact";
import files from "../../../stdlib/stdlib";
import { Project } from "../../../config/parseConfig";
import { readFile, writeFile } from "fs/promises";
import { Counter } from "./counter";
import { runCommand } from "../../../cli/test-util.build";
import { Transaction } from "../parse-log";

const cwdFolder = join(__dirname, "../../");
const contractPath = join(__dirname, '../../benchmarks/contracts/jetton_minter_discoverable.tact')
const exPath = join(__dirname, '../../../stdlib/stdlib/std/stdlib_ex.fc');
const symbolsPath = join(__dirname, 'symbols.json');
const delta = 1000;

export const main = async () => {
    const projects: Project[] = [{
        name: basename(contractPath, extname(contractPath)),
        path: contractPath,
        output: join(dirname(contractPath), "output"),
        options: {},
        // mode: "fullWithDecompilation",
    }];
    const project = createNodeFileSystem(cwdFolder, false);
    
    const stdlib = createVirtualFileSystem("@stdlib", files, false);
   
    const counter: Counter = {
        ref: 0,
        lines: [],
    };

    const compileResult1 = await run({
        config: { projects },
        logger: new Logger(LogLevel.INFO),
        project,
        stdlib,
        counter,
        generateIds: false,
    });
    if (!compileResult1.ok) {
        console.error(compileResult1.error);
        return;
    }
    const locations = counter.ref;
    if (!locations) {
        console.error('no locations');
        return;
    }
    
    let str = await readFile(exPath, 'utf-8');
    for (let i = 0; i < locations; ++i) {
        const id = delta + i;
        str += `() __tact_foo${i}() impure asm """\n    ${id} PUSHINT\n    DROP\n""";\n`
    }

    stdlib.writeFile("@stdlib/std/stdlib_ex.fc", str);

    const counter2: Counter = {
        ref: 0,
        lines: [],
    };

    const compileResult2 = await run({
        config: { projects },
        logger: new Logger(LogLevel.INFO),
        project,
        stdlib,
        generateIds: true,
        counter: counter2,
    });
    if (!compileResult2.ok) {
        console.error(compileResult2.error);
        return;
    }

    // console.log(counter2.lines);

    const res = await runCommand('ts-node ' + join(__dirname, 'test.ts'))
    if (res.kind === 'signaled') {
        console.error('signaled', res);
        return;
    }

    const transactions = JSON.parse(res.stdout) as Transaction[];
    const allAsm = transactions.flatMap(t => t.asm);

    const steps: Step[] = [];
    for (const { command, args } of allAsm) {
        if (command !== 'PUSHINT') {
            continue;
        }
        const v = parseInt(args, 10);
        if (delta <= v && v < delta + locations) {
            const line = counter2.lines[v - delta];
            if (!line) {
                throw new Error('Line not found??');
            }
            steps.push(line);
        }
    }
    await writeFile(symbolsPath, JSON.stringify(steps, null, 4), 'utf-8');
};

type Step = {
    source: string;
    lineNum: number;
}

void main();