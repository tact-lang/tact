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

        // Compare with second nullable
        expect(await contract.getCompare1(1n, 2n)).toBe(false);
        expect(await contract.getCompare1(1n, 1n)).toBe(true);
        expect(await contract.getCompare1(1n, null)).toBe(false);
        expect(await contract.getCompare2(1n, 2n)).toBe(true);
        expect(await contract.getCompare2(1n, 1n)).toBe(false);
        expect(await contract.getCompare2(1n, null)).toBe(true);

        // Compare with first nullable
        expect(await contract.getCompare3(2n, 1n)).toBe(false);
        expect(await contract.getCompare3(1n, 1n)).toBe(true);
        expect(await contract.getCompare3(null, 1n)).toBe(false);
        expect(await contract.getCompare4(2n, 1n)).toBe(true);
        expect(await contract.getCompare4(1n, 1n)).toBe(false);
        expect(await contract.getCompare4(null, 1n)).toBe(true);

        // Compare with both nullable
        expect(await contract.getCompare5(2n, 1n)).toBe(false);
        expect(await contract.getCompare5(1n, 1n)).toBe(true);
        expect(await contract.getCompare5(null, 1n)).toBe(false);
        expect(await contract.getCompare5(1n, null)).toBe(false);
        expect(await contract.getCompare5(null, null)).toBe(true);

        expect(await contract.getCompare6(2n, 1n)).toBe(true);
        expect(await contract.getCompare6(1n, 1n)).toBe(false);
        expect(await contract.getCompare6(null, 1n)).toBe(true);
        expect(await contract.getCompare6(1n, null)).toBe(true);
        expect(await contract.getCompare6(null, null)).toBe(false);
    });
});