import fs from 'fs';
import path from 'path';
import { compileContract } from 'ton-compiler';
import { beginCell, Cell, Dictionary } from 'ton-core';
import { fromBoc } from 'tvm-disassembler/dist/disassembler';
import { writeTypescript } from '../bindings/writeTypescript';
import { ConfigProject } from "../config/parseConfig";
import { CompilerContext, enable } from "../context";
import { PackageFileFormat } from '../packaging/fileFormat';
import { packageCode } from '../packaging/packageCode';
import { getContracts, getType } from '../types/resolveDescriptors';
import { compile } from './compile';
import { precompile } from "./precompile";
const version = require('../../package.json').version;

export async function build(project: ConfigProject, rootPath: string) {

    // Configure context
    let ctx: CompilerContext = new CompilerContext({ shared: {} });
    if (project.experimental && project.experimental.inline) {
        console.warn('   > 👀 Enabling inline');
        ctx = enable(ctx, 'inline');
    }
    if (project.experimental && project.experimental.debug) {
        console.warn('   > 👀 Enabling debug');
        ctx = enable(ctx, 'debug');
    }

    // Precompile
    try {
        ctx = precompile(ctx, project.path);
    } catch (e) {
        console.warn('Tact compilation failed');
        console.log(e);
        return false;
    }

    // Resolve and create output directory
    let outputPath = path.resolve(rootPath, project.output);
    if (!fs.existsSync(outputPath)) {
        fs.mkdirSync(outputPath);
    }

    // Compile contracts
    let ok = true;
    let built: {
        [key: string]: {
            codeBoc: Buffer,
            initBoc: Buffer,
            codeFunc: string,
            initFunc: string,
            codeFift: string,
            initFift: string,
            codeFiftDecompiled: string,
            initFiftDecompiled: string,
            abi: string
        }
    } = {};
    for (let contract of getContracts(ctx)) {
        let pathAbi = path.resolve(outputPath, project.name + '_' + contract + ".abi");

        let pathCodeFc = path.resolve(outputPath, project.name + '_' + contract + ".code.fc");
        let pathCodeBoc = path.resolve(outputPath, project.name + '_' + contract + ".code.boc");
        let pathCodeFif = path.resolve(outputPath, project.name + '_' + contract + ".code.fif");
        let pathCodeFifDec = path.resolve(outputPath, project.name + '_' + contract + ".code.rev.fif");

        let pathInitFc = path.resolve(outputPath, project.name + '_' + contract + ".init.fc");
        let pathInitBoc = path.resolve(outputPath, project.name + '_' + contract + ".init.boc");
        let pathInitFif = path.resolve(outputPath, project.name + '_' + contract + ".init.fif");
        let pathInitFifDec = path.resolve(outputPath, project.name + '_' + contract + ".init.rev.fif");

        // Compiling contract to func
        console.log('   > ' + contract + ': tact compiler');
        let abi: string;
        let codeFunc: string;
        let initFunc: string;
        try {
            let res = await compile(ctx, contract);
            fs.writeFileSync(pathCodeFc, res.output.output, 'utf-8');
            fs.writeFileSync(pathInitFc, res.output.initOutput, 'utf-8');
            fs.writeFileSync(pathAbi, res.output.abi, 'utf-8');
            abi = res.output.abi;
            codeFunc = res.output.output;
            initFunc = res.output.initOutput;
        } catch (e) {
            console.warn('Tact compilation failed');
            console.warn(e);
            ok = false;
            continue;
        }

        // Compiling contract to TVM
        console.log('   > ' + contract + ': func compiler');
        let codeBoc: Buffer;
        let codeFift: string;
        let initBoc: Buffer;
        let initFift: string;
        try {
            let c = await compileContract({ files: [pathCodeFc] });
            if (!c.ok) {
                console.warn(c.log);
                ok = false;
                continue;
            }
            let c2 = await compileContract({ files: [pathInitFc] });
            if (!c2.ok) {
                console.warn(c2.log);
                ok = false;
                continue;
            }
            fs.writeFileSync(pathCodeFif, c.fift, 'utf-8');
            fs.writeFileSync(pathCodeBoc, c.output);
            fs.writeFileSync(pathInitFif, c2.fift, 'utf-8');
            fs.writeFileSync(pathInitBoc, c2.output);
            codeFift = c.fift;
            codeBoc = c.output;
            initFift = c2.fift;
            initBoc = c2.output;
        } catch (e) {
            console.warn('FunC compiler crashed');
            console.warn(e);
            ok = false;
            continue;
        }

        // Fift decompiler for generated code debug
        console.log('   > ' + contract + ': fift decompiler');
        let codeFiftDecompiled: string;
        let initFiftDecompiled: string;
        try {
            codeFiftDecompiled = fromBoc(codeBoc);
            initFiftDecompiled = fromBoc(initBoc);
            fs.writeFileSync(pathCodeFifDec, codeFiftDecompiled, 'utf-8');
            fs.writeFileSync(pathInitFifDec, initFiftDecompiled, 'utf-8');
        } catch (e) {
            console.warn('Fift decompiler crashed');
            console.warn(e);
            ok = false;
            continue;
        }

        // Add to built map
        built[contract] = {
            codeFunc,
            codeBoc,
            codeFift,
            codeFiftDecompiled,
            initFunc,
            initBoc,
            initFift,
            initFiftDecompiled,
            abi
        };
    }
    if (!ok) {
        console.log('💥 Compilation failed. Skipping packaging');
        return false;
    }

    // Package
    console.log('   > Packaging');
    let contracts = project.contracts || getContracts(ctx);
    let packages: PackageFileFormat[] = [];
    for (let contract of contracts) {
        console.log('   > ' + contract);
        let artifacts = built[contract];
        if (!artifacts) {
            console.warn('   > ' + contract + ': no artifacts found');
            return false;
        }

        // System cell
        const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
        for (let c of getType(ctx, contract).dependsOn) {
            let cd = built[c.name];
            if (!cd) {
                console.warn('   > ' + cd + ': no artifacts found');
                return false;
            }
            depends.set(c.uid, Cell.fromBoc(cd.codeBoc)[0]);
        }
        const systemCell = beginCell().storeDict(depends).endCell();

        // Package
        let pkg: PackageFileFormat = {
            name: contract,
            abi: artifacts.abi,
            code: artifacts.codeBoc.toString('base64'),
            init: {
                code: artifacts.initBoc.toString('base64'),
                args: []
            },
            deployment: {
                kind: 'system-cell',
                system: systemCell.toBoc().toString('base64')
            },
            compiler: {
                name: 'tact',
                version
            }
        };
        let pkgData = packageCode(pkg);
        let pathPkg = path.resolve(outputPath, project.name + '_' + contract + ".pkg");
        fs.writeFileSync(pathPkg, pkgData);
        packages.push(pkg);
    }

    // Bindings
    console.log('   > Bindings');
    for (let pkg of packages) {
        console.log('   > ' + pkg.name);
        if (pkg.deployment.kind !== 'system-cell') {
            console.warn('   > ' + pkg.name + ': unsupported deployment kind ' + pkg.deployment.kind);
            return false;
        }
        try {
            let bindings = writeTypescript(JSON.parse(pkg.abi), pkg.code, pkg.init.code, pkg.deployment.system);
            let pathBindings = path.resolve(outputPath, project.name + '_' + pkg.name + ".ts");
            fs.writeFileSync(pathBindings, bindings, 'utf-8');
        } catch (e) {
            console.warn('Bindings compiler crashed');
            console.warn(e);
            return false;
        }
    }

    return true;
}