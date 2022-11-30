import fs from 'fs';
import { compile } from '../main';

describe('integration', () => {
    let recs = fs.readdirSync(__dirname + "/test/");
    for (let r of recs) {
        if (r.endsWith(".tact")) {
            it('should resolve expressions for ' + r, () => {
                let code = fs.readFileSync(__dirname + "/test/" + r, 'utf8');
                let res = compile(code);
                expect(res).toEqual(fs.readFileSync(__dirname + "/test/" + r + '.fc', 'utf8'));
            });
        }
    }
});