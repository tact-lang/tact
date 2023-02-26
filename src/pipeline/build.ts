import { beginCell, Cell, Dictionary } from 'ton-core';
import { fromBoc } from 'tvm-disassembler/dist/disassembler';
import { writeTypescript } from '../bindings/writeTypescript';
import { ConfigProject } from "../config/parseConfig";
import { CompilerContext, enable } from "../context";
import { funcCompile } from '../func/funcCompile';
import { writeReport } from '../generator/writeReport';
import files from '../imports/stdlib';
import { PackageFileFormat } from '../packaging/fileFormat';
import { packageCode } from '../packaging/packageCode';
import { createABITypeRefFromTypeRef } from '../types/resolveABITypeRef';
import { getContracts, getType } from '../types/resolveDescriptors';
import { createVirtualFileSystem } from '../vfs/createVirtualFileSystem';
import { VirtualFileSystem } from '../vfs/VirtualFileSystem';
import { compile } from './compile';
import { precompile } from "./precompile";
const version = require('../../package.json').version;

export async function build(args: {
    config: ConfigProject,
    project: VirtualFileSystem,
    stdlib: string
}) {

    const { config, project } = args;
    const stdlib = createVirtualFileSystem(args.stdlib, files);

    // Configure context
    let ctx: CompilerContext = new CompilerContext({ shared: {} });
    let cfg: any = {};
    if (config.experimental && config.experimental.inline) {
        console.warn('   > 👀 Enabling inline');
        ctx = enable(ctx, 'inline');
        cfg['inline'] = true;
    }
    if (config.parameters && config.parameters.debug) {
        console.warn('   > 👀 Enabling debug');
        ctx = enable(ctx, 'debug');
        cfg['debug'] = true;
    }

    // Precompile
    try {
        ctx = precompile(ctx, project, stdlib, config.path);
    } catch (e) {
        console.warn('Tact compilation failed');
        console.log(e);
        return false;
    }

    // Compile contracts
    let ok = true;
    let built: {
        [key: string]: {
            codeBoc: Buffer,
            codeFunc: string,
            codeFift: string,
            codeFiftDecompiled: string,
            abi: string
        }
    } = {};
    for (let contract of getContracts(ctx)) {
        let pathAbi = project.resolve(config.output, config.name + '_' + contract + ".abi");

        let pathCodeFc = project.resolve(config.output, config.name + '_' + contract + ".code.fc");
        let pathCodeBoc = project.resolve(config.output, config.name + '_' + contract + ".code.boc");
        let pathCodeFif = project.resolve(config.output, config.name + '_' + contract + ".code.fif");
        let pathCodeFifDec = project.resolve(config.output, config.name + '_' + contract + ".code.rev.fif");

        // Compiling contract to func
        console.log('   > ' + contract + ': tact compiler');
        let abi: string;
        let codeFunc: string;
        try {
            let res = await compile(ctx, contract);
            project.writeFile(pathCodeFc, res.output.output);
            project.writeFile(pathAbi, res.output.abi);
            abi = res.output.abi;
            codeFunc = res.output.output;
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
        try {
            let stdlibPath = stdlib.resolve('stdlib.fc');
            let stdlibCode = stdlib.readFile(stdlibPath).toString();
            let stdlibExPath = stdlib.resolve('stdlib_ex.fc');
            let stdlibExCode = stdlib.readFile(stdlibExPath).toString();
            let c = await funcCompile([{
                path: stdlibPath,
                content: stdlibCode
            }, {
                path: stdlibExPath,
                content: stdlibExCode,
            }, {
                path: pathCodeFc,
                content: codeFunc
            }]);
            if (!c.ok) {
                console.warn(c.log);
                ok = false;
                continue;
            }
            project.writeFile(pathCodeFif, c.fift);
            project.writeFile(pathCodeBoc, c.output);
            codeFift = c.fift;
            codeBoc = c.output;
        } catch (e) {
            console.warn('FunC compiler crashed');
            console.warn(e);
            ok = false;
            continue;
        }

        // Fift decompiler for generated code debug
        console.log('   > ' + contract + ': fift decompiler');
        let codeFiftDecompiled: string;
        try {
            codeFiftDecompiled = fromBoc(codeBoc);
            project.writeFile(pathCodeFifDec, codeFiftDecompiled);
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
            abi
        };
    }
    if (!ok) {
        console.log('💥 Compilation failed. Skipping packaging');
        return false;
    }

    // Package
    console.log('   > Packaging');
    let contracts = config.contracts || getContracts(ctx);
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
        const ct = getType(ctx, contract);
        depends.set(ct.uid, Cell.fromBoc(built[ct.name].codeBoc)[0]); // Mine
        for (let c of ct.dependsOn) {
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
                kind: 'direct',
                args: getType(ctx, contract).init!.args.map((v) => ({ name: v.name, type: createABITypeRefFromTypeRef(v.type) })),
                prefix: {
                    bits: 1,
                    value: 0,
                },
                deployment: {
                    kind: 'system-cell',
                    system: systemCell.toBoc().toString('base64')
                },
            },
            compiler: {
                name: 'tact',
                version,
                parameters: JSON.stringify(cfg)
            }
        };
        let pkgData = packageCode(pkg);
        let pathPkg = project.resolve(config.output, config.name + '_' + contract + ".pkg");
        project.writeFile(pathPkg, pkgData);
        packages.push(pkg);
    }

    // Bindings
    console.log('   > Bindings');
    for (let pkg of packages) {
        console.log('   > ' + pkg.name);
        if (pkg.init.deployment.kind !== 'system-cell') {
            console.warn('   > ' + pkg.name + ': unsupported deployment kind ' + pkg.init.deployment.kind);
            return false;
        }
        try {
            let bindingsServer = writeTypescript(JSON.parse(pkg.abi), {
                code: pkg.code,
                prefix: pkg.init.prefix,
                system: pkg.init.deployment.system,
                args: pkg.init.args
            });
            project.writeFile(project.resolve(config.output, config.name + '_' + pkg.name + ".ts"), bindingsServer);
        } catch (e) {
            console.warn('Bindings compiler crashed');
            console.warn(e);
            return false;
        }
    }

    // Reports
    console.log('   > Reports');
    for (let pkg of packages) {
        console.log('   > ' + pkg.name);
        try {
            let report = writeReport(ctx, pkg);
            let pathBindings = project.resolve(config.output, config.name + '_' + pkg.name + ".md");
            project.writeFile(pathBindings, report);
        } catch (e) {
            console.warn('Report generation crashed');
            console.warn(e);
            return false;
        }
    }

    return true;
}