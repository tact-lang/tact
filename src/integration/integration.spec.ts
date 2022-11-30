import fs from 'fs';
import { compile } from '../main';

describe('integration', () => {
    let recs = fs.readdirSync(__dirname + "/test/");
    for (let r of recs) {
        it('should resolve expressions for ' + r, () => {
            let code = fs.readFileSync(__dirname + "/test/" + r, 'utf8');
            let res = compile(code);
            expect(res).toMatchSnapshot();
        });
    }
});