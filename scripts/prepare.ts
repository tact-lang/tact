import fs from 'fs';
import { run } from '../src/node';
import { fromCode } from 'tvm-disassembler';
import { Cell } from 'ton-core';
import { build } from '../src/pipeline/build';
import { FuncCompilationResult, funcCompile } from '../src/func/funcCompile';
import path from 'path';
import { ConfigProject } from '../src/config/parseConfig';
import { createNodeFileSystem } from '../src/vfs/createNodeFileSystem';
import { glob } from 'glob';
import { verify } from '../src/verify';

// Read cases
(async () => {

    // Compile projects
    await run({ configPath: __dirname + '/../tact.config.json' });

    // Verify projects
    for (let pkgPath of glob.sync(path.normalize(path.resolve(__dirname, '..', 'examples', 'output', '*.pkg')))) {
        let res = await verify(fs.readFileSync(pkgPath, 'utf-8'));
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
                path: p.path + '/' + r,
                output: './output/',
            };
            let stdlib = '@stdlib';
            let project = createNodeFileSystem(p.path, false);
            await build({
                config,
                stdlib,
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
                let stdlibPath = path.resolve(__dirname, '../src/stdlib/stdlib.fc');
                let stdlib = fs.readFileSync(stdlibPath, 'utf-8');
                let code = fs.readFileSync(p.path + r, 'utf-8');
                c = await funcCompile([{
                    path: stdlibPath,
                    content: stdlib
                }, {
                    path: p.path + r,
                    content: code
                }]);
                if (!c.ok) {
                    console.warn(c.log);
                    continue;
                }
            } catch (e) {
                console.warn('Failed');
                continue;
            }
            fs.writeFileSync(p.path + r + ".fift", c.fift!);
            fs.writeFileSync(p.path + r + ".cell", c.output!);

            // Cell -> Fift decpmpiler
            let source = fromCode(Cell.fromBoc(c.output!)[0]);
            fs.writeFileSync(p.path + r + ".rev.fift", source);
        }
    }
})();