import fs from 'fs';
import { compile, precompile } from './main';
import { compileContract } from 'ton-compiler';
import { createABI } from './generator/createABI';
import { writeTypescript } from './generator/writeTypescript';
import { fromCode } from 'tvm-disassembler';
import { Cell } from 'ton';

// Read cases
(async () => {

    for (let p of [{ path: __dirname + "/test/contracts/", importPath: '../../abi/deploy' }, { path: __dirname + "/examples/", importPath: '../abi/deploy' }]) {
        let recs = fs.readdirSync(p.path);
        for (let r of recs) {
            if (!r.endsWith('.tact')) {
                continue;
            }

            try {

                // Precompile
                console.log('Processing ' + p.path + r);
                let ctx = precompile(p.path + r);

                // Tact -> FunC
                let res = compile(ctx);
                fs.writeFileSync(p.path + r + ".fc", res.output);

                // FunC -> Fift/Cell
                let c = await compileContract({ files: [p.path + r + ".fc"] });
                if (!c.ok) {
                    console.warn(c.log);
                    continue;
                }
                fs.writeFileSync(p.path + r + ".fift", c.fift!);
                fs.writeFileSync(p.path + r + ".cell", c.output!);

                // Cell -> Fift decpmpiler
                let source = fromCode(Cell.fromBoc(c.output!)[0]);
                fs.writeFileSync(p.path + r + ".rev.fift", source);

                // Tact -> ABI
                let abi = createABI(res.ctx);
                fs.writeFileSync(p.path + r + ".abi", JSON.stringify(abi, null, 2));

                // ABI -> Typescript
                let ts = writeTypescript(abi, c.output.toString('base64'), p.importPath);
                fs.writeFileSync(p.path + r + ".api.ts", ts);
            } catch (e) {
                console.warn(e);
            }
        }
    }

    for (let p of [{ path: __dirname + "/../func/" }]) {
        let recs = fs.readdirSync(p.path);
        for (let r of recs) {
            if (!r.endsWith('.fc')) {
                continue;
            }

            // Precompile
            console.log('Processing ' + p.path + r);
            let c = await compileContract({ files: [p.path + r] });
            if (!c.ok) {
                console.warn(c.log);
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