import fs from 'fs';
import { CompilerContext } from '../context';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { loadCases } from '../utils/loadCases';
import { precompile } from '../pipeline/precompile';
import { compile } from '../pipeline/compile';
import { getContracts } from '../types/resolveDescriptors';
import { createNodeFileSystem } from '../vfs/createNodeFileSystem';
import { createVirtualFileSystem } from '../vfs/createVirtualFileSystem';
import files from '../imports/stdlib';

describe('integration', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (const r of loadCases(__dirname + "/contracts/")) {
        it('should resolve expressions for ' + r.name, async () => {
            let ctx = new CompilerContext({ shared: {} });
            const project = createNodeFileSystem(__dirname + "/contracts/");
            const stdlib = createVirtualFileSystem('@stdlib', files);
            ctx = precompile(ctx, project, stdlib, r.name + '.tact');
            const contract = getContracts(ctx)[0];
            const res = await compile(ctx, contract, r.name + '_' + contract);
            for (const f of res.output.files) {
                expect(f.code).toEqual(fs.readFileSync(__dirname + "/contracts/output/" + f.name, 'utf8'));
            }
        });
    }
});