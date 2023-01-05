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
            boc: Buffer,
            func: string,
            fift: string,
            fiftDecompiled: string,
            abi: string
        }
    } = {};
    for (let contract of getContracts(ctx)) {
        let pathAbi = path.resolve(outputPath, project.name + '_' + contract + ".abi");
        let pathCodeFc = path.resolve(outputPath, project.name + '_' + contract + ".fc");
        let pathCodeBoc = path.resolve(outputPath, project.name + '_' + contract + ".boc");
        let pathCodeFif = path.resolve(outputPath, project.name + '_' + contract + ".fif");
        let pathCodeFifDec = path.resolve(outputPath, project.name + '_' + contract + ".rev.fif");

        // Compiling contract to func
        console.log('   > ' + contract + ': tact compiler');
        let abi: string;
        let func: string;
        try {
            let res = await compile(ctx, contract);
            fs.writeFileSync(pathCodeFc, res.output.output, 'utf-8');
            fs.writeFileSync(pathAbi, res.output.abi, 'utf-8');
            abi = res.output.abi;
            func = res.output.output;
        } catch (e) {
            console.warn('Tact compilation failed');
            console.warn(e);
            ok = false;
            continue;
        }

        // Compiling contract to TVM
        console.log('   > ' + contract + ': func compiler');
        let boc: Buffer;
        let fift: string;
        try {
            let c = await compileContract({ files: [pathCodeFc] });
            if (!c.ok) {
                console.warn(c.log);
                ok = false;
                continue;
            }
            fs.writeFileSync(pathCodeFif, c.fift, 'utf-8');
            fs.writeFileSync(pathCodeBoc, c.output);
            fift = c.fift;
            boc = c.output;
        } catch (e) {
            console.warn('FunC compiler crashed');
            console.warn(e);
            ok = false;
            continue;
        }

        // Fift decompiler for generated code debug
        console.log('   > ' + contract + ': fift decompiler');
        let fiftDecompiled: string;
        try {
            fiftDecompiled = fromBoc(boc);
            fs.writeFileSync(pathCodeFifDec, fiftDecompiled, 'utf-8');
        } catch (e) {
            console.warn('Fift decompiler crashed');
            console.warn(e);
            ok = false;
            continue;
        }

        // Add to built map
        built[contract] = {
            boc,
            fift,
            fiftDecompiled,
            func,
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
            depends.set(c.uid, Cell.fromBoc(cd.boc)[0]);
        }
        const systemCell = beginCell().storeDict(depends).endCell();

        // Package
        let pkg: PackageFileFormat = {
            name: contract,
            date: new Date().toISOString(),
            abi: artifacts.abi,
            code: artifacts.boc.toString('base64'),
            init: {
                code: '',
                args: []
            },
            deployment: {
                kind: 'system-cell',
                system: systemCell.toBoc().toString('base64')
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
            let bindings = writeTypescript(JSON.parse(pkg.abi), pkg.code, pkg.deployment.system);
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