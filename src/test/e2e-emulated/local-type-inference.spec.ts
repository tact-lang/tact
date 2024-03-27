import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { LocalTypeInferenceTester } from './features/output/local-type-inference_LocalTypeInferenceTester';

describe('feature-local-type-inference', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should automatically set types for let statements', async () => {

        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await LocalTypeInferenceTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();
        
        expect(contract.abi).toMatchSnapshot();
        expect(await contract.getTest1()).toStrictEqual(1n);
        expect(await contract.getTest2()).toStrictEqual(2n);
        expect((await contract.getTest3()).toRawString()).toBe(contract.address.toRawString());
        expect((await contract.getTest4()).toRawString()).toBe(contract.address.toRawString());
        expect(await contract.getTest5()).toStrictEqual(true);
    });
});