import { beginCell, Dictionary, toNano } from '@ton/core';
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
        let cellA = beginCell().storeUint(0, 32).endCell();
        let cellB = beginCell().storeUint(1, 32).endCell();
        let dictA = Dictionary.empty<bigint, bigint>().set(0n, 0n);
        let dictB = Dictionary.empty<bigint, bigint>().set(0n, 2n);
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();

        // Tests
        expect(await contract.getAdd(1n, 2n)).toBe(3n);
        expect(await contract.getAdd(1n, -2n)).toBe(-1n);
        expect(await contract.getSub(1n, 2n)).toBe(-1n);
        expect(await contract.getSub(1n, -2n)).toBe(3n);
        expect(await contract.getMul(2n, 2n)).toBe(4n);
        expect(await contract.getDiv(2n, 2n)).toBe(1n);

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

        // IsNull Cell
        expect(await contract.getIsNull3(cellA)).toBe(false);
        expect(await contract.getIsNull3(cellB)).toBe(false);
        expect(await contract.getIsNull3(null)).toBe(true);

        // IsNotNull Address
        expect(await contract.getIsNotNull3(cellA)).toBe(true);
        expect(await contract.getIsNotNull3(cellB)).toBe(true);
        expect(await contract.getIsNotNull3(null)).toBe(false);

        // Cell equals
        expect(await contract.getCompare19(cellA, cellB)).toBe(false);
        expect(await contract.getCompare19(cellB, cellA)).toBe(false);
        expect(await contract.getCompare19(cellA, cellA)).toBe(true);
        expect(await contract.getCompare20(cellA, cellB)).toBe(false);
        expect(await contract.getCompare20(cellB, cellA)).toBe(false);
        expect(await contract.getCompare20(cellA, cellA)).toBe(true);
        expect(await contract.getCompare20(cellB, null)).toBe(false);
        expect(await contract.getCompare20(cellA, null)).toBe(false);
        expect(await contract.getCompare21(cellA, cellB)).toBe(false);
        expect(await contract.getCompare21(cellB, cellA)).toBe(false);
        expect(await contract.getCompare21(cellA, cellA)).toBe(true);
        expect(await contract.getCompare21(null, cellB)).toBe(false);
        expect(await contract.getCompare21(null, cellA)).toBe(false);
        expect(await contract.getCompare22(cellA, cellB)).toBe(false);
        expect(await contract.getCompare22(cellB, cellA)).toBe(false);
        expect(await contract.getCompare22(cellA, cellA)).toBe(true);
        expect(await contract.getCompare22(null, cellB)).toBe(false);
        expect(await contract.getCompare22(null, cellA)).toBe(false);
        expect(await contract.getCompare22(cellB, null)).toBe(false);
        expect(await contract.getCompare22(cellA, null)).toBe(false);
        expect(await contract.getCompare22(null, null)).toBe(true);
        expect(await contract.getCompare22(null, null)).toBe(true);

        // Cell not equals
        expect(await contract.getCompare23(cellA, cellB)).toBe(true);
        expect(await contract.getCompare23(cellB, cellA)).toBe(true);
        expect(await contract.getCompare23(cellA, cellA)).toBe(false);
        expect(await contract.getCompare24(cellA, cellB)).toBe(true);
        expect(await contract.getCompare24(cellB, cellA)).toBe(true);
        expect(await contract.getCompare24(cellA, cellA)).toBe(false);
        expect(await contract.getCompare24(cellB, null)).toBe(true);
        expect(await contract.getCompare24(cellA, null)).toBe(true);
        expect(await contract.getCompare25(cellA, cellB)).toBe(true);
        expect(await contract.getCompare25(cellB, cellA)).toBe(true);
        expect(await contract.getCompare25(cellA, cellA)).toBe(false);
        expect(await contract.getCompare25(null, cellB)).toBe(true);
        expect(await contract.getCompare25(null, cellA)).toBe(true);
        expect(await contract.getCompare26(cellA, cellB)).toBe(true);
        expect(await contract.getCompare26(cellB, cellA)).toBe(true);
        expect(await contract.getCompare26(cellA, cellA)).toBe(false);
        expect(await contract.getCompare26(null, cellB)).toBe(true);
        expect(await contract.getCompare26(null, cellA)).toBe(true);
        expect(await contract.getCompare26(cellB, null)).toBe(true);
        expect(await contract.getCompare26(cellA, null)).toBe(true);
        expect(await contract.getCompare26(null, null)).toBe(false);
        expect(await contract.getCompare26(null, null)).toBe(false);

        // Test maps
        expect(await contract.getCompare27(dictA, dictB)).toBe(false);
        expect(await contract.getCompare27(dictB, dictA)).toBe(false);
        expect(await contract.getCompare27(dictA, dictA)).toBe(true);
        expect(await contract.getCompare28(dictA, dictB)).toBe(true);
        expect(await contract.getCompare28(dictB, dictA)).toBe(true);
        expect(await contract.getCompare28(dictA, dictA)).toBe(false);
    });
});