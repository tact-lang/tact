import fs from 'fs';
import { decompileAll } from '@tact-lang/opcode';
import { run } from '../src/node';
import { Cell } from '@ton/core';
import { build } from '../src/pipeline/build';
import { FuncCompilationResult, funcCompile } from '../src/func/funcCompile';
import path from 'path';
import { ConfigProject } from '../src/config/parseConfig';
import { createNodeFileSystem } from '../src/vfs/createNodeFileSystem';
import { glob } from 'glob';
import { verify } from '../src/verify';
import { consoleLogger } from '../src/logger';
import { __DANGER__disableVersionNumber } from '../src/pipeline/version';
import {getRootDir} from "../src/utils/utils";

// Read cases
(async () => {

    // Disable version number in packages
    __DANGER__disableVersionNumber();

    // Compile projects
    await run({ configPath: __dirname + '/../tact.config.json' });

    // Verify projects
    for (let pkgPath of glob.sync(path.normalize(path.resolve(__dirname, '..', 'examples', 'output', '*.pkg')))) {
        let res = await verify({ pkg: fs.readFileSync(pkgPath, 'utf-8') });
        if (!res.ok) {
            console.warn('Failed to verify ' + pkgPath + ': ' + res.error);
        }
    }

    // Compile test contracts
    for (let p of [{ path: path.resolve(__dirname, '..', 'src', 'test', 'contracts') }]) {
        let recs = fs.readdirSync(p.path);
        for (let r of recs) {
            if (!r.endsWith('.tact')) {
                continue;
            }

            let config: ConfigProject = {
                name: r.slice(0, r.length - '.tact'.length),
                path: './' + r,
                output: './output/',
            };
            let stdlib = '@stdlib';
            let npm = createNodeFileSystem(path.resolve(getRootDir(), "node_modules"));
            let project =  createNodeFileSystem(p.path, false);
            await build({
                config,
                stdlib,
                npm,
                project
            });
        }
    }

    // Compile func files
    for (let p of [{ path: __dirname + "/../func/" }]) {
        let recs = fs.readdirSync(p.path);
        for (let r of recs) {
            if (!r.endsWith('.fc')) {
                continue;
            }

            // Precompile
            console.log('Processing ' + p.path + r);
            let c: FuncCompilationResult;
            try {
                let stdlibPath = path.resolve(__dirname, '..', 'stdlib', 'stdlib.fc');
                let stdlib = fs.readFileSync(stdlibPath, 'utf-8');
                let code = fs.readFileSync(p.path + r, 'utf-8');
                c = await funcCompile({
                    entries: [
                        stdlibPath,
                        p.path + r
                    ],
                    sources: [{
                        path: stdlibPath,
                        content: stdlib
                    }, {
                        path: p.path + r,
                        content: code
                    }],
                    logger: consoleLogger
                });
                if (!c.ok) {
                    console.warn(c.log);
                    continue;
                }
            } catch (e) {
                console.warn(e);
                console.warn('Failed');
                continue;
            }
            fs.writeFileSync(p.path + r + ".fift", c.fift!);
            fs.writeFileSync(p.path + r + ".cell", c.output!);

            // Cell -> Fift decpmpiler
            let source = decompileAll({ src: c.output! });
            fs.writeFileSync(p.path + r + ".rev.fift", source);
        }
    }
})();