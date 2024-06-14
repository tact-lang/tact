import { Dictionary, beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import {
    MyStruct1,
    MyStruct2,
    StructsTester,
} from "./contracts/output/structs_StructsTester";

describe("structs", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement structs parsing and writing correctly", async () => {
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
    });
});
