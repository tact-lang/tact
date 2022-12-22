import { MultisigContract_init } from "./output/multisig-3_MultisigContract";
import { createExecutorFromCode } from 'ton-nodejs';
import { Address, Cell, contractAddress } from "ton";
import BN from "bn.js";

describe('muiltisig-3', () => {
    it('should deploy', async () => {

        let key1 = new BN(1);
        let key2 = new BN(2);
        let key3 = new BN(3);
        let res = await MultisigContract_init(key1, key2, key3);
        expect(res.data.toDebugString()).toMatchSnapshot();

        let executor = await createExecutorFromCode(res);
        expect((await executor.get('seqno')).stack.readBigNumber().toString(10)).toBe('0');

        expect((await executor.get('key1')).stack.readBigNumber().toString(10)).toBe('1');
        expect((await executor.get('key2')).stack.readBigNumber().toString(10)).toBe('2');
        expect((await executor.get('key3')).stack.readBigNumber().toString(10)).toBe('3');

        // let tp = (await executor.get('testAddress')).stack.readTuple();
        // let n = tp.readNumber();
        // let n2 = tp.readBigNumber();
        // let a = new Address(n, Buffer.from(n2.toString(16).padStart(64, '0'), 'hex'));
        // console.warn(a.toFriendly());
        // let addr = contractAddress({ workchain: 0, initialCode: new Cell(), initialData: new Cell() });
        // console.warn(addr.toFriendly());
    });
});