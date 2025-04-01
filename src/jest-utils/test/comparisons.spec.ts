import { Address, beginCell } from "@ton/core";
import {
    compareAddressForTest,
    compareCellForTest,
    compareSliceForTest,
} from "@/jest-utils/test/comparisons";

describe("Cell comparison", () => {
    it("should work", () => {
        const cell = beginCell()
            .storeUint(1, 32)
            .storeRef(beginCell().storeUint(2, 32))
            .endCell();
        const same = beginCell().storeSlice(cell.beginParse()).endCell();
        const notSame = beginCell().storeUint(3, 32).endCell();

        const passed = compareCellForTest(cell, same);
        expect(passed.pass).toBeTruthy();
        expect(passed.posMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
to equal
x{00000001}
 x{00000002}"
`);
        expect(passed.negMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
NOT to equal
x{00000001}
 x{00000002}
but it does"
`);
        const failed = compareCellForTest(cell, notSame);
        expect(failed.pass).toBeFalsy();
        expect(failed.posMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
to equal
x{00000003}"
`);
        expect(failed.negMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
NOT to equal
x{00000003}
but it does"
`);
    });
});

describe("Address comparison", () => {
    it("should work", () => {
        const addr = new Address(
            0,
            Buffer.from(
                "40148c1cc823bf3c192da81e92d75d75b425f92052226c7eba2855bc7803ef14",
                "hex",
            ),
        );
        const same = new Address(addr.workChain, addr.hash);
        const notSame = new Address(
            -1,
            Buffer.from(
                "366c52da74350a23470952bd07ef8642d34f5fc5138194f17ab193fe522a6aae",
                "hex",
            ),
        );

        const passed = compareAddressForTest(addr, same);
        expect(passed.pass).toBeTruthy();
        expect(passed.posMessage()).toMatchInlineSnapshot(
            `"Expected EQBAFIwcyCO_PBktqB6S1111tCX5IFIibH66KFW8eAPvFBHq to equal EQBAFIwcyCO_PBktqB6S1111tCX5IFIibH66KFW8eAPvFBHq"`,
        );
        expect(passed.negMessage()).toMatchInlineSnapshot(
            `"Expected EQBAFIwcyCO_PBktqB6S1111tCX5IFIibH66KFW8eAPvFBHq NOT to equal EQBAFIwcyCO_PBktqB6S1111tCX5IFIibH66KFW8eAPvFBHq, but it does"`,
        );
        const failed = compareAddressForTest(addr, notSame);
        expect(failed.pass).toBeFalsy();
        expect(failed.posMessage()).toMatchInlineSnapshot(
            `"Expected EQBAFIwcyCO_PBktqB6S1111tCX5IFIibH66KFW8eAPvFBHq to equal Ef82bFLadDUKI0cJUr0H74ZC009fxROBlPF6sZP-Uipqrn1J"`,
        );
        expect(failed.negMessage()).toMatchInlineSnapshot(
            `"Expected EQBAFIwcyCO_PBktqB6S1111tCX5IFIibH66KFW8eAPvFBHq NOT to equal Ef82bFLadDUKI0cJUr0H74ZC009fxROBlPF6sZP-Uipqrn1J, but it does"`,
        );
    });
});

describe("Slice comparison", () => {
    it("should work", () => {
        const slice = beginCell()
            .storeUint(1, 32)
            .storeRef(beginCell().storeUint(2, 32))
            .endCell()
            .beginParse();
        const same = beginCell().storeSlice(slice).endCell().beginParse();
        const notSame = beginCell().storeUint(3, 32).endCell().beginParse();

        const passed = compareSliceForTest(slice, same);
        expect(passed.pass).toBeTruthy();
        expect(passed.posMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
to equal
x{00000001}
 x{00000002}"
`);
        expect(passed.negMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
NOT to equal
x{00000001}
 x{00000002}
but it does"
`);
        const failed = compareSliceForTest(slice, notSame);
        expect(failed.pass).toBeFalsy();
        expect(failed.posMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
to equal
x{00000003}"
`);
        expect(failed.negMessage()).toMatchInlineSnapshot(`
"Expected
x{00000001}
 x{00000002}
NOT to equal
x{00000003}
but it does"
`);
    });
});
