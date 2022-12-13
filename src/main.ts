import { CompilerContext } from "./context";
import fs from 'fs';
import path from 'path';
import { getAllTypes, resolveDescriptors } from "./types/resolveDescriptors";
import { writeProgram } from "./generator/writeProgram";
import { resolveAllocations } from "./storage/resolveAllocation";
import { createABI } from "./generator/createABI";
import { openContext } from "./grammar/store";
import { resolveStatements } from "./types/resolveStatements";
import { resolvePackaging } from "./types/resolvePackaging";
import { parseImports } from "./grammar/grammar";
import { Config, parseConfig } from "./config/parseConfig";
import { compileContract } from "ton-compiler";
import { fromCode } from "tvm-disassembler";
import { Cell } from "ton";
import { ContractABI } from "./abi/ContractABI";
import { writeTypescript } from "./generator/writeTypescript";

function loadLibrary(path: string, name: string) {

    // Check stdlib
    if (name.startsWith('@stdlib/')) {
        let p = name.substring('@stdlib/'.length);
        if (fs.existsSync(__dirname + '/../stdlib/' + p + '.tact')) {
            return fs.readFileSync(__dirname + '/../stdlib/' + p + '.tact', 'utf-8');
        } else {
            console.warn(__dirname + '/../stdlib/' + p + '.tact');
            throw new Error('Cannot find stdlib module ' + name);
        }
    }

    throw new Error('Cannot find module ' + name);
}

export function precompile(path: string) {

    // Load stdlib
    const stdlib = fs.readFileSync(__dirname + '/../stdlib/stdlib.tact', 'utf-8');
    const code = fs.readFileSync(path, 'utf8');
    const imported: string[] = [];
    let processed = new Set<string>();
    let pending: string[] = parseImports(code);
    while (pending.length > 0) {

        // Pick next
        let p = pending.shift()!;
        if (processed.has(p)) {
            continue;
        }

        // Load library
        let loaded = loadLibrary(path, p);
        imported.push(loaded);
        processed.add(p);

        // Add imports
        pending = [...pending, ...parseImports(loaded)];
    }

    // Perform initial compiler steps
    let ctx = openContext([stdlib, ...imported, code]);
    ctx = resolveDescriptors(ctx);
    ctx = resolveAllocations(ctx);
    ctx = resolveStatements(ctx);
    ctx = resolvePackaging(ctx);

    // Prepared context
    return ctx;
}

export function getContracts(ctx: CompilerContext) {
    return Object.values(getAllTypes(ctx)).filter((v) => v.kind === 'contract').map((v) => v.name);
}

export function compile(ctx: CompilerContext, name: string | null) {
    let abi = createABI(ctx, name);
    let output = writeProgram(ctx, abi, name);
    let cOutput = output;
    return { output: cOutput, ctx };
}

export async function compileProjects(configPath: string, projectNames: string[] = []) {

    // Load config
    let resolvedPath = path.resolve(configPath);
    let rootPath = path.dirname(resolvedPath);
    let config: Config;
    if (!fs.existsSync(resolvedPath)) {
        console.warn('Unable to find config file at ' + resolvedPath);
        return;
    }
    try {
        config = parseConfig(fs.readFileSync(resolvedPath, 'utf8'));
    } catch (e) {
        console.log(e);
        console.warn('Unable to parse config file at ' + resolvedPath);
        return;
    }

    // Resolve projects
    let projects = config.projects;
    if (projectNames.length > 0) {

        // Check that all proejct names are valid
        for (let pp of projectNames) {
            if (!projects.find((v) => v.name === pp)) {
                console.warn('Unable to find project ' + pp);
                return;
            }
        }

        // Filter by names
        projects = projects.filter((v) => projectNames.includes(v.name));
    }
    if (projects.length === 0) {
        console.warn('No projects to compile');
        return;
    }

    // Compile projects
    for (let project of projects) {

        // Start compilation
        console.log('💼 Compiling project ' + project.name + '...');
        let outputPath = path.resolve(rootPath, project.output);
        let ctx = precompile(project.path);
        if (!fs.existsSync(outputPath)) {
            fs.mkdirSync(outputPath);
        }

        // Compile contracts
        let ok = true;
        let built: { [key: string]: { code: string, abi: ContractABI } } = {};
        for (let contract of getContracts(ctx)) {
            let pathFc = path.resolve(outputPath, project.name + '_' + contract + ".fc");
            let pathBoc = path.resolve(outputPath, project.name + '_' + contract + ".boc");
            let pathFif = path.resolve(outputPath, project.name + '_' + contract + ".fif");
            let pathFifDec = path.resolve(outputPath, project.name + '_' + contract + ".rev.fif");
            let pathAbi = path.resolve(outputPath, project.name + '_' + contract + ".abi");

            // Compiling contract to func
            console.log('   > ' + contract + ': tact compiler');
            try {
                let res = compile(ctx, contract);
                fs.writeFileSync(pathFc, res.output);
            } catch (e) {
                console.warn('Tact compilation failed');
                console.warn(e);
                ok = false;
                continue;
            }

            // Compiling contract to TVM
            console.log('   > ' + contract + ': func compiler');
            let boc: Buffer;
            try {
                let c = await compileContract({ files: [pathFc] });
                if (!c.ok) {
                    console.warn(c.log);
                    ok = false;
                    continue;
                }
                fs.writeFileSync(pathFif, c.fift!);
                fs.writeFileSync(pathBoc, c.output!);
                boc = c.output!;
            } catch (e) {
                console.warn('FunC compiler crashed');
                console.warn(e);
                ok = false;
                continue;
            }

            // Cell -> Fift decompiler
            console.log('   > ' + contract + ': fift decompiler');
            try {
                let source = fromCode(Cell.fromBoc(boc)[0]);
                fs.writeFileSync(pathFifDec, source);
            } catch (e) {
                console.warn('Fift decompiler crashed, skipping...');
                console.warn(e);
                continue;
            }

            // Tact -> ABI
            let abi: ContractABI;
            try {
                console.log('   > ' + contract + ': abi generator');
                abi = createABI(ctx, contract);
                fs.writeFileSync(pathAbi, JSON.stringify(abi, null, 2));
            } catch (e) {
                console.warn('ABI generation crashed');
                console.warn(e);
                ok = false;
                continue;
            }

            // Register results
            built[contract] = {
                code: boc.toString('base64'),
                abi
            };
        }
        if (!ok) {
            console.log('💥 Compilation failed. Skipping bindings generation');
            continue;
        }

        // Finalize compilation
        let contracts = project.contracts || getContracts(ctx);
        for (let contract of contracts) {
            console.log('   > ' + contract + ': bindings');
            let pathBindings = path.resolve(outputPath, project.name + '_' + contract + ".ts");
            let v = built[contract];
            let ts = writeTypescript(v.abi, v.code, built);
            fs.writeFileSync(pathBindings, ts);
        }
    }
} 