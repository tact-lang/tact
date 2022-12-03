import { MultisigContract_init } from "./multisig-3.tact.api";
import { createExecutorFromCode } from 'ton-nodejs';

describe('muiltisig-3', () => {
    it('should deploy', async () => {
        
        let key1 = 1n;
        let key2 = 2n;
        let key3 = 3n;
        let res = await MultisigContract_init(key1, key2, key3);
        expect(res.data.toDebugString()).toMatchSnapshot();

        let executor = await createExecutorFromCode(res);
        expect((await executor.get('seqno')).stack.readBigNumber().toString(10)).toBe('0');
    });
});