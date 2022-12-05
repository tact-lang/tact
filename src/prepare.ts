import fs from 'fs';
import { compile } from './main';
import { compileContract } from 'ton-compiler';
import { createABI } from './generator/createABI';
import { writeTypescript } from './generator/writeTypescript';

// Read cases
(async () => {
    try {
        for (let p of [__dirname + "/test/test/", __dirname + "/examples/"]) {
            let recs = fs.readdirSync(p);
            for (let r of recs) {
                if (!r.endsWith('.tact')) {
                    continue;
                }

                // Tact -> FunC
                let code = fs.readFileSync(p + r, 'utf8');
                let res = compile(code);
                fs.writeFileSync(p + r + ".fc", res.output);

                // FunC -> Fift/Cell
                let c = await compileContract({ files: [p + r + ".fc"] });
                if (!c.ok) {
                    console.warn(c.log);
                }
                fs.writeFileSync(p + r + ".fift", c.fift!);
                fs.writeFileSync(p + r + ".cell", c.output!);

                // Tact -> ABI
                let abi = createABI(res.ctx, c.output!.toString('base64'));
                fs.writeFileSync(p + r + ".abi", JSON.stringify(abi, null, 2));

                // ABI -> Typescript
                let ts = writeTypescript(abi);
                fs.writeFileSync(p + r + ".api.ts", ts);
            }
        }
    } catch (e) {
        console.warn(e);
    }
})();