import fs from 'fs';
import { compile, getContracts, precompile } from './main';
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
                let contracts = getContracts(ctx);

                // Process all contracts
                for (let contract of contracts) {
                    console.log('Contract: ' + contract);
                    let prefix = (p.path + r).slice(0, (p.path + r).length - 5) + '.' + contract;

                    // Tact -> FunC
                    let res = compile(ctx, '');
                    fs.writeFileSync(prefix + ".fc", res.output);

                    // FunC -> Fift/Cell
                    let c = await compileContract({ files: [prefix + ".fc"] });
                    if (!c.ok) {
                        console.warn(c.log);
                        continue;
                    }
                    fs.writeFileSync(prefix + ".fift", c.fift!);
                    fs.writeFileSync(prefix + ".cell", c.output!);

                    // Cell -> Fift decpmpiler
                    let source = fromCode(Cell.fromBoc(c.output!)[0]);
                    fs.writeFileSync(prefix + ".rev.fift", source);

                    // Tact -> ABI
                    let abi = createABI(res.ctx);
                    fs.writeFileSync(prefix + ".abi", JSON.stringify(abi, null, 2));

                    // ABI -> Typescript
                    let ts = writeTypescript(abi, c.output.toString('base64'), p.importPath);
                    fs.writeFileSync(prefix + ".bind.ts", ts);
                }
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