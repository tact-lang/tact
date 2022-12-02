import fs from 'fs';
import { compile } from '../main';
import { compileContract } from 'ton-compiler';

// Read cases
(async () => {
    for (let p of [__dirname + "/test/", __dirname + "/../examples/"]) {
        let recs = fs.readdirSync(p);
        for (let r of recs) {
            if (!r.endsWith('.tact')) {
                continue;
            }
            let code = fs.readFileSync(p + r, 'utf8');
            let res = compile(code);
            fs.writeFileSync(p + r + ".fc", res);
            let c = await compileContract({ files: [p + r + ".fc"] });
            if (!c.ok) {
                console.warn(c.log);
            }
            fs.writeFileSync(p + r + ".fift", c.fift!);
            fs.writeFileSync(p + r + ".cell", c.output!);
        }
    }
})();