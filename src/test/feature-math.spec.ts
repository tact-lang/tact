import { toNano } from 'ton-core';
import { ContractSystem, randomAddress } from '@tact-lang/emulator';
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
        let addressA = randomAddress('a');
        let addressB = randomAddress('b');
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

        // >
        expect(await contract.getCompare7(2n, 1n)).toBe(true);
        expect(await contract.getCompare7(1n, 2n)).toBe(false);
        expect(await contract.getCompare7(1n, 1n)).toBe(false);

        // >=
        expect(await contract.getCompare8(2n, 1n)).toBe(true);
        expect(await contract.getCompare8(1n, 2n)).toBe(false);
        expect(await contract.getCompare8(1n, 1n)).toBe(true);

        // <
        expect(await contract.getCompare9(2n, 1n)).toBe(false);
        expect(await contract.getCompare9(1n, 2n)).toBe(true);
        expect(await contract.getCompare9(1n, 1n)).toBe(false);

        // <=
        expect(await contract.getCompare10(2n, 1n)).toBe(false);
        expect(await contract.getCompare10(1n, 2n)).toBe(true);
        expect(await contract.getCompare10(1n, 1n)).toBe(true);

        // IsNul
        expect(await contract.getIsNull1(0n)).toBe(false);
        expect(await contract.getIsNull1(-1n)).toBe(false);
        expect(await contract.getIsNull1(1n)).toBe(false);
        expect(await contract.getIsNull1(null)).toBe(true);

        // IsNotNull
        expect(await contract.getIsNotNull1(0n)).toBe(true);
        expect(await contract.getIsNotNull1(-1n)).toBe(true);
        expect(await contract.getIsNotNull1(1n)).toBe(true);
        expect(await contract.getIsNotNull1(null)).toBe(false);

        // IsNull Address
        expect(await contract.getIsNull2(addressA)).toBe(false);
        expect(await contract.getIsNull2(addressB)).toBe(false);
        expect(await contract.getIsNull2(null)).toBe(true);

        // IsNotNull Address
        expect(await contract.getIsNotNull2(addressA)).toBe(true);
        expect(await contract.getIsNotNull2(addressB)).toBe(true);
        expect(await contract.getIsNotNull2(null)).toBe(false);

        // Address equals
        expect(await contract.getCompare11(addressA, addressB)).toBe(false);
        expect(await contract.getCompare11(addressB, addressA)).toBe(false);
        expect(await contract.getCompare11(addressA, addressA)).toBe(true);
        expect(await contract.getCompare12(addressA, addressB)).toBe(false);
        expect(await contract.getCompare12(addressB, addressA)).toBe(false);
        expect(await contract.getCompare12(addressA, addressA)).toBe(true);
        expect(await contract.getCompare12(addressB, null)).toBe(false);
        expect(await contract.getCompare12(addressA, null)).toBe(false);
        expect(await contract.getCompare13(addressA, addressB)).toBe(false);
        expect(await contract.getCompare13(addressB, addressA)).toBe(false);
        expect(await contract.getCompare13(addressA, addressA)).toBe(true);
        expect(await contract.getCompare13(null, addressB)).toBe(false);
        expect(await contract.getCompare13(null, addressA)).toBe(false);
        expect(await contract.getCompare14(addressA, addressB)).toBe(false);
        expect(await contract.getCompare14(addressB, addressA)).toBe(false);
        expect(await contract.getCompare14(addressA, addressA)).toBe(true);
        expect(await contract.getCompare14(null, addressB)).toBe(false);
        expect(await contract.getCompare14(null, addressA)).toBe(false);
        expect(await contract.getCompare14(addressB, null)).toBe(false);
        expect(await contract.getCompare14(addressA, null)).toBe(false);
        expect(await contract.getCompare14(null, null)).toBe(true);
        expect(await contract.getCompare14(null, null)).toBe(true);

        // Address not equals
        expect(await contract.getCompare15(addressA, addressB)).toBe(true);
        expect(await contract.getCompare15(addressB, addressA)).toBe(true);
        expect(await contract.getCompare15(addressA, addressA)).toBe(false);
        expect(await contract.getCompare16(addressA, addressB)).toBe(true);
        expect(await contract.getCompare16(addressB, addressA)).toBe(true);
        expect(await contract.getCompare16(addressA, addressA)).toBe(false);
        expect(await contract.getCompare16(addressB, null)).toBe(true);
        expect(await contract.getCompare16(addressA, null)).toBe(true);
        expect(await contract.getCompare17(addressA, addressB)).toBe(true);
        expect(await contract.getCompare17(addressB, addressA)).toBe(true);
        expect(await contract.getCompare17(addressA, addressA)).toBe(false);
        expect(await contract.getCompare17(null, addressB)).toBe(true);
        expect(await contract.getCompare17(null, addressA)).toBe(true);
        expect(await contract.getCompare18(addressA, addressB)).toBe(true);
        expect(await contract.getCompare18(addressB, addressA)).toBe(true);
        expect(await contract.getCompare18(addressA, addressA)).toBe(false);
        expect(await contract.getCompare18(null, addressB)).toBe(true);
        expect(await contract.getCompare18(null, addressA)).toBe(true);
        expect(await contract.getCompare18(addressB, null)).toBe(true);
        expect(await contract.getCompare18(addressA, null)).toBe(true);
        expect(await contract.getCompare18(null, null)).toBe(false);
        expect(await contract.getCompare18(null, null)).toBe(false);
    });
});