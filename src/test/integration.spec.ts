import fs from 'fs';
import { __DANGER_resetNodeId } from '../ast/ast';
import { compile } from '../main';
import { loadCases } from '../utils/loadCases';

describe('integration', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (let r of loadCases(__dirname + "/test/")) {
        it('should resolve expressions for ' + r.name, () => {
            let res = compile(r.code);
            expect(res.output).toEqual(fs.readFileSync(__dirname + "/test/" + r.name + '.tact.fc', 'utf8'));
        });
    }
});