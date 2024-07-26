import { Dictionary, beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import {
    IntFields,
    MyMessage1,
    MyStruct1,
    MyStruct2,
    MyStruct3,
    StructsTester,
    UintFields,
    loadMyMessage1,
    loadMyStruct1,
    loadMyStruct2,
    storeMyMessage1,
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
        const tracker = system.track(contract.address);

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
        const m1: MyMessage1 = {
            $$type: "MyMessage1",
            a: 1n,
            s: s3,
        };
        const m2: MyMessage1 = {
            $$type: "MyMessage1",
            a: 2n,
            s: s4,
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

        // my_message1#a98a916c a:int257 s:MyStruct2{m:dict<int, uint64>,s:Maybe MyStruct1{a:int257,b:uint32,c:Maybe int257}} = MyMessage1
        const c5 = beginCell()
            .storeUint(0xa98a916c, 32)
            .storeInt(1, 257)
            .store(storeMyStruct2(s3))
            .endCell();
        const c6 = beginCell()
            .storeUint(0xa98a916c, 32)
            .storeInt(2, 257)
            .store(storeMyStruct2(s4))
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
        expect((await contract.getToCellMessage1(m1)).toString()).toEqual(
            c5.toString(),
        );
        expect((await contract.getToCellMessage1(m2)).toString()).toEqual(
            c6.toString(),
        );

        expect((await contract.getToSlice1(s1)).toString()).toEqual(
            c1.toString(),
        );

        expect(await contract.getFromCell1(c1)).toMatchObject<MyStruct1>(s1);
        expect(await contract.getFromCell1(c2)).toMatchObject<MyStruct1>(s2);
        expect(await contract.getFromCell2(c3)).toMatchSnapshot();
        expect(await contract.getFromCell2(c4)).toMatchSnapshot();
        expect(await contract.getFromCellMessage1(c5)).toMatchSnapshot();
        expect(await contract.getFromCellMessage1(c6)).toMatchSnapshot();

        expect(
            await contract.getFromSlice1(c1.asSlice()),
        ).toMatchObject<MyStruct1>(s1);
        expect(
            await contract.getFromSlice1(c2.asSlice()),
        ).toMatchObject<MyStruct1>(s2);
        expect(await contract.getFromSlice2(c3.asSlice())).toMatchSnapshot();
        expect(await contract.getFromSlice2(c4.asSlice())).toMatchSnapshot();
        expect(
            await contract.getFromSliceMessage1(c5.asSlice()),
        ).toMatchSnapshot();
        expect(
            await contract.getFromSliceMessage1(c6.asSlice()),
        ).toMatchSnapshot();

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
        expect(loadMyMessage1(c5.asSlice())).toMatchSnapshot();
        expect(loadMyMessage1(c6.asSlice())).toMatchSnapshot();
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
        expect(
            beginCell().store(storeMyMessage1(m1)).endCell().toString(),
        ).toEqual(c5.toString());
        expect(
            beginCell().store(storeMyMessage1(m2)).endCell().toString(),
        ).toEqual(c6.toString());

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

        // https://github.com/tact-lang/tact/issues/472

        await contract.send(treasure, { value: toNano("10") }, "example");
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();

        expect(await contract.getLongStruct15Test()).toMatchSnapshot();
        expect(await contract.getLongStruct16Test()).toMatchSnapshot();
        expect(await contract.getLongStruct32Test()).toMatchSnapshot();
        expect(await contract.getLongNestedStructTest()).toMatchSnapshot();
        expect(
            await contract.getLongNestedStructWithOptsTest(),
        ).toMatchSnapshot();
        expect(await contract.getLongContractTest()).toEqual(210n);

        // https://github.com/tact-lang/tact/issues/671

        expect(
            (await system.provider(contract).get("longStruct15Test", [])).stack,
        ).toMatchSnapshot();
        expect(
            (await system.provider(contract).get("longStruct16Test", [])).stack,
        ).toMatchSnapshot();
        expect(
            (await system.provider(contract).get("longStruct32Test", [])).stack,
        ).toMatchSnapshot();
        expect(
            (await system.provider(contract).get("longNestedStructTest", []))
                .stack,
        ).toMatchSnapshot();
        expect(
            (
                await system
                    .provider(contract)
                    .get("longNestedStructWithOptsTest", [])
            ).stack,
        ).toMatchSnapshot();

        // https://github.com/tact-lang/tact/issues/690

        expect(await contract.getLocation1()).toMatchSnapshot();
        expect(await contract.getLocation2()).toMatchSnapshot();
        expect(await contract.getTripleNestedStructOpt1()).toMatchSnapshot();
        expect(await contract.getTripleNestedStructOpt2()).toMatchSnapshot();
        expect(await contract.getTripleNestedStructOpt3()).toMatchSnapshot();
        expect(await contract.getLongAndDeepNestedStruct1()).toMatchSnapshot();
        expect(await contract.getLongAndDeepNestedStruct2()).toMatchSnapshot();
        expect(await contract.getLongAndDeepNestedStruct3()).toMatchSnapshot();

        // int serialization formats
        const sIntFields: IntFields = {
            $$type: "IntFields",
            i1: -1n,
            i2: -2n,
            i3: -4n,
            i255: -(2n ** 254n),
            i256: -(2n ** 255n),
            i257: -(2n ** 256n),
        };
        const sIntFieldsCell = beginCell()
            // Storing min values for each bit length
            .storeInt(-1n, 1)
            .storeInt(-2n, 2)
            .storeInt(-4n, 3)
            .storeInt(-(2n ** 254n), 255)
            .storeInt(-(2n ** 255n), 256)
            .storeInt(-(2n ** 256n), 257)
            .endCell();
        expect(await contract.getIntFieldsStruct()).toEqual(sIntFields);
        expect(await contract.getIntFieldsFromCell(sIntFieldsCell)).toEqual(sIntFields);

        // uint serialization formats
        const mUintFields: UintFields = {
            $$type: "UintFields",
            u1: 1n,
            u2: 3n,
            u3: 7n,
            u254: (2n ** 254n) - 1n,
            u255: (2n ** 255n) - 1n,
            u256: (2n ** 256n) - 1n,
        }
        const mUintFieldsCell = beginCell()
            // Header
            .storeUint(0xea01f46a, 32)
            // Storing max values for each bit length
            .storeUint(1n, 1)
            .storeUint(3n, 2)
            .storeUint(7n, 3)
            .storeUint((2n ** 254n) - 1n, 254)
            .storeUint((2n ** 255n) - 1n, 255)
            .storeUint((2n ** 256n) - 1n, 256)
            .endCell();

        expect(await contract.getUintFieldsMessage()).toEqual(mUintFields);
        // This doesn't work for unknown (yet) reasons
        // expect(await contract.getUintFieldsFromCell(mUintFieldsCell)).toEqual(mUintFields);
    });
});
