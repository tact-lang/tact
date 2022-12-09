import fs from 'fs';
import { compile, precompile } from './main';
import { compileContract } from 'ton-compiler';
import { createABI } from './generator/createABI';
import { writeTypescript } from './generator/writeTypescript';

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
                let code = fs.readFileSync(p.path + r, 'utf8');
                let ctx = precompile(code);

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
})();