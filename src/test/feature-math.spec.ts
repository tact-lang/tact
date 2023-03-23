import { toNano } from 'ton-core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { MathTester } from './features/output/math_MathTester';

describe('feature-math', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should perform basic math operations correctly', async () => {

        // Init
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await MathTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();

        // Tests
        expect(await contract.getAdd(1n, 2n)).toBe(3n);
        expect(await contract.getAdd(1n, -2n)).toBe(-1n);

        // Basic Compare
        expect(await contract.getCompare1(1n, 2n)).toBe(false);
        expect(await contract.getCompare1(1n, 1n)).toBe(true);
        expect(await contract.getCompare2(1n, 2n)).toBe(true);
        expect(await contract.getCompare2(1n, 1n)).toBe(false);

        // Compare with nullable
        expect(await contract.getCompare1(1n, 2n)).toBe(false);
        expect(await contract.getCompare1(1n, 1n)).toBe(true);
        expect(await contract.getCompare1(1n, null)).toBe(false);
    });
});