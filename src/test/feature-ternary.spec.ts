import { beginCell, toNano } from 'ton-core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { TernaryTester } from './features/output/ternary_TernaryTester';

describe('feature-ternary', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement ternary operator correctly', async () => {

        // Init
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await TernaryTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, null);
        await system.run();

        // Check methods
        expect(await contract.getTest1(123n)).toEqual(1n);
        expect(await contract.getTest1(5n)).toEqual(2n);

        expect(await contract.getTest2(123n)).toEqual(246n);
        expect(await contract.getTest2(5n)).toEqual(15n);

        expect(await contract.getTest3(2n, 2n)).toEqual(1n);
        expect(await contract.getTest3(2n, 3n)).toEqual(2n);

        expect(await contract.getTest4(123n, 456n)).toEqual(1n);
        expect(await contract.getTest4(123n, 5n)).toEqual(2n);
        expect(await contract.getTest4(5n, 789n)).toEqual(3n);
        expect(await contract.getTest4(5n, 5n)).toEqual(4n);
    });
});