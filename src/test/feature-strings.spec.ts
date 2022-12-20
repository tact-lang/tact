import { Cell, stringToCell } from 'ton';
import { createExecutorFromCode } from 'ton-nodejs';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { StringsTester, StringsTester_init } from './features/output/strings_StringsTester';

describe('feature-strings', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement strings correctly', async () => {

        // Init
        let init = await StringsTester_init();
        let executor = await createExecutorFromCode(init);
        let contract = new StringsTester(executor);

        // Check methods
        expect(await contract.getConstantString()).toBe('test string');
        expect((await contract.getDynamicStringCell()).equals(stringToCell(''))).toBe(true);
    });
});