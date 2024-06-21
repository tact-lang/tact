import { Dictionary, beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import {
    MyStruct1,
    MyStruct2,
    MyStruct3,
    StructsTester,
    loadMyStruct1,
    loadMyStruct2,
    storeMyStruct1,
    storeMyStruct2,
} from "./contracts/output/structs_StructsTester";

describe("structs", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement structs correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await StructsTester.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        expect(await contract.getStructInitializerTest()).toEqual(true);

        // Prepare test values
        const s1: MyStruct1 = {
            $$type: "MyStruct1",
            a: 1n,
            b: 2n,
            c: 3n,
        };
        const s2: MyStruct1 = {
            $$type: "MyStruct1",
            a: 1n,
            b: 2n,
            c: null,
        };
        const s3: MyStruct2 = {
            $$type: "MyStruct2",
            m: Dictionary.empty(
                Dictionary.Keys.BigInt(257),
                Dictionary.Values.BigUint(64),
            ),
            s: s1,
        };
        const s4: MyStruct2 = {
            $$type: "MyStruct2",
            m: Dictionary.empty(
                Dictionary.Keys.BigInt(257),
                Dictionary.Values.BigUint(64),
            ),
            s: null,
        };

        const c1 = beginCell()
            .storeInt(1, 257)
            .storeUint(2, 32)
            .storeBit(true) // has c
            .storeInt(3, 257)
            .endCell();
        const c2 = beginCell()
            .storeInt(1, 257)
            .storeUint(2, 32)
            .storeBit(false) // no c
            .endCell();
        const c3 = beginCell()
            .storeBit(false) // empty dict
            .storeBit(true) // has struct
            .storeSlice(c1.asSlice())
            .endCell();
        const c4 = beginCell()
            .storeBit(false) // empty dict
            .storeBit(false) // no struct
            .endCell();

        // Test smart contract

        expect((await contract.getToCell1(s1)).toString()).toEqual(
            c1.toString(),
        );
        expect((await contract.getToCell1(s2)).toString()).toEqual(
            c2.toString(),
        );
        expect((await contract.getToCell2(s3)).toString()).toEqual(
            c3.toString(),
        );
        expect((await contract.getToCell2(s4)).toString()).toEqual(
            c4.toString(),
        );

        expect(await contract.getFromCell1(c1)).toMatchObject<MyStruct1>(s1);
        expect(await contract.getFromCell1(c2)).toMatchObject<MyStruct1>(s2);
        expect(await contract.getFromCell2(c3)).toMatchSnapshot();
        expect(await contract.getFromCell2(c4)).toMatchSnapshot();

        expect(await contract.getFromSlice1(c1)).toMatchObject<MyStruct1>(s1);
        expect(await contract.getFromSlice1(c2)).toMatchObject<MyStruct1>(s2);
        expect(await contract.getFromSlice2(c3)).toMatchSnapshot();
        expect(await contract.getFromSlice2(c4)).toMatchSnapshot();

        expect((await contract.getTest1(s1, s3)).toString()).toEqual(
            beginCell().storeRef(c1).storeRef(c3).endCell().toString(),
        );
        expect((await contract.getTest1(s2, s4)).toString()).toEqual(
            beginCell().storeRef(c2).storeRef(c4).endCell().toString(),
        );
        expect((await contract.getTest1(s1, s4)).toString()).toEqual(
            beginCell().storeRef(c1).storeRef(c4).endCell().toString(),
        );
        expect((await contract.getTest1(s2, s3)).toString()).toEqual(
            beginCell().storeRef(c2).storeRef(c3).endCell().toString(),
        );

        // Test wrappers

        expect(loadMyStruct1(c1.asSlice())).toMatchObject<MyStruct1>(s1);
        expect(loadMyStruct1(c2.asSlice())).toMatchObject<MyStruct1>(s2);
        expect(loadMyStruct2(c3.asSlice())).toMatchSnapshot();
        expect(loadMyStruct2(c4.asSlice())).toMatchSnapshot();
        expect(
            beginCell().store(storeMyStruct1(s1)).endCell().toString(),
        ).toEqual(c1.toString());
        expect(
            beginCell().store(storeMyStruct1(s2)).endCell().toString(),
        ).toEqual(c2.toString());
        expect(
            beginCell().store(storeMyStruct2(s3)).endCell().toString(),
        ).toEqual(c3.toString());
        expect(
            beginCell().store(storeMyStruct2(s4)).endCell().toString(),
        ).toEqual(c4.toString());

        // Negative parsing tests

        await expect(
            contract.getFromCell1(beginCell().storeUint(0, 123).endCell()),
        ).rejects.toThrow("Cell underflow");

        await expect(
            contract.getFromCell1(
                beginCell()
                    .storeStringTail(
                        "a long string a long string a long string a long string a long string a long string a long string a long string a long string",
                    )
                    .endCell(),
            ),
        ).rejects.toThrow("Cell underflow");

        expect(() =>
            loadMyStruct1(beginCell().storeUint(0, 123).endCell().asSlice()),
        ).toThrow();

        const s5: MyStruct3 = {
            $$type: "MyStruct3",
            s: "contract const struct test",
        };
        const s6: MyStruct3 = {
            $$type: "MyStruct3",
            s: "global const struct test",
        };
        expect(await contract.getContractStructConstantImmediate()).toEqual(s5);
        expect(await contract.getGlobalConstStructConstantImmediate()).toEqual(
            s6,
        );
        expect(
            await contract.getContractStructConstantFieldImmediate(),
        ).toEqual(s5.s);
        expect(
            await contract.getGlobalConstStructConstantFieldImmediate(),
        ).toEqual(s6.s);

        expect(await contract.getContractStructConstantViaVar()).toEqual(s5);
        expect(await contract.getGlobalConstStructConstantViaVar()).toEqual(s6);
        expect(await contract.getContractStructConstantFieldViaVar()).toEqual(
            s5.s,
        );
        expect(
            await contract.getGlobalConstStructConstantFieldViaVar(),
        ).toEqual(s6.s);
    });
});
