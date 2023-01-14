import fs from 'fs';
import { compileProjects } from '../src/main';
import { fromCode } from 'tvm-disassembler';
import { Cell } from 'ton-core';
import { build } from '../src/pipeline/build';
import { funcCompile } from '../src/func/funcCompile';
import path from 'path';

// Read cases
(async () => {

    // Compile projects
    await compileProjects(__dirname + '/../tact.config.json');

    // Compile test contracts
    for (let p of [{ path: path.resolve(__dirname, '..', 'src', 'test', 'contracts') }]) {
        let recs = fs.readdirSync(p.path);
        for (let r of recs) {
            if (!r.endsWith('.tact')) {
                continue;
            }

            await build({ name: r.slice(0, r.length - '.tact'.length), path: p.path + '/' + r, output: './output/' }, p.path);
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
            let c;
            try {
                c = await funcCompile(p.path + r);
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