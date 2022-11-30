import fs from 'fs';
import { compile } from '../main';
import { compileContract } from 'ton-compiler';

// Read cases
(async () => {
    let recs = fs.readdirSync(__dirname + "/test/");
    for (let r of recs) {
        if (!r.endsWith('.tact')) {
            continue;
        }
        let code = fs.readFileSync(__dirname + "/test/" + r, 'utf8');
        let res = compile(code);
        fs.writeFileSync(__dirname + "/test/" + r + ".fc", res);
        let c = await compileContract({ files: [__dirname + "/test/" + r + ".fc"] });
        if (!c.ok) {
            console.warn(c.log);
        }
        fs.writeFileSync(__dirname + "/test/" + r + ".fift", c.fift!);
        fs.writeFileSync(__dirname + "/test/" + r + ".cell", c.output!);
    }
})();