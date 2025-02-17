import { Dictionary, beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type {
    IntFields,
    MyMessage1,
    MyStruct1,
    MyStruct2,
    MyStruct3,
    OptionalFields,
    S1,
    UintFields,
} from "./contracts/output/structs_StructsTester";
import {
    StructsTester,
    loadMyMessage1,
    loadMyStruct1,
    loadMyStruct2,
    storeMyMessage1,
    storeMyStruct1,
    storeMyStruct2,
} from "./contracts/output/structs_StructsTester";
import "@ton/test-utils";

describe("structs", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<StructsTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await StructsTester.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement structs correctly", async () => {
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
        ).rejects.toThrow("Unable to execute get method. Got exit_code: 9");

        await expect(
            contract.getFromCell1(
                beginCell()
                    .storeStringTail(
                        "a long string a long string a long string a long string a long string a long string a long string a long string a long string",
                    )
                    .endCell(),
            ),
        ).rejects.toThrow("Unable to execute get method. Got exit_code: 9");

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

        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "example",
        );
        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: 9,
        });

        {
            const sendResult = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                "exampleVarIntegers",
            );
            expect(sendResult.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                success: true,
            });
        }

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
            (
                await blockchain
                    .provider(contract.address)
                    .get("longStruct15Test", [])
            ).stack,
        ).toMatchSnapshot();
        expect(
            (
                await blockchain
                    .provider(contract.address)
                    .get("longStruct16Test", [])
            ).stack,
        ).toMatchSnapshot();
        expect(
            (
                await blockchain
                    .provider(contract.address)
                    .get("longStruct32Test", [])
            ).stack,
        ).toMatchSnapshot();
        expect(
            (
                await blockchain
                    .provider(contract.address)
                    .get("longNestedStructTest", [])
            ).stack,
        ).toMatchSnapshot();
        expect(
            (
                await blockchain
                    .provider(contract.address)
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

        // https://github.com/tact-lang/tact/issues/374

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
        expect(await contract.getIntFieldsFromCell(sIntFieldsCell)).toEqual(
            sIntFields,
        );

        // uint serialization formats
        const mUintFields: UintFields = {
            $$type: "UintFields",
            u1: 1n,
            u2: 3n,
            u3: 7n,
            u254: 2n ** 254n - 1n,
            u255: 2n ** 255n - 1n,
            u256: 2n ** 256n - 1n,
        };
        const _mUintFieldsCell = beginCell()
            // Header
            .storeUint(0xea01f46a, 32)
            // Storing max values for each bit length
            .storeUint(1n, 1)
            .storeUint(3n, 2)
            .storeUint(7n, 3)
            .storeUint(2n ** 254n - 1n, 254)
            .storeUint(2n ** 255n - 1n, 255)
            .storeUint(2n ** 256n - 1n, 256)
            .endCell();

        expect(await contract.getUintFieldsMessage()).toEqual(mUintFields);

        // https://github.com/tact-lang/tact/issues/767

        const m = Dictionary.empty(
            Dictionary.Keys.Uint(8),
            Dictionary.Values.BigVarUint(4),
        );
        m.set(1, 1n);
        m.set(2, 2n);
        m.set(3, 3n);
        const result = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "Foo",
                s: beginCell().storeDict(m).endCell().asSlice(),
            },
        );
        expect(result.transactions).toHaveTransaction({
            on: contract.address,
            success: true,
        });
        expect(result.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            body: beginCell().storeDict(m).endCell(),
        });

        const optionalFields: OptionalFields = {
            $$type: "OptionalFields",
            nickname: null,
            avatar: "non-null string",
        };
        expect(
            await contract.getOptionalFields(),
        ).toMatchObject<OptionalFields>(optionalFields);

        // Struct destructuring
        expect(await contract.getDestructuringTest1()).toBe(43n);
        expect(await contract.getDestructuringTest1Const()).toBe(43n);
        expect(await contract.getDestructuringTest2()).toBe(42n);
        expect(await contract.getDestructuringTest2Const()).toBe(42n);
        expect(await contract.getDestructuringTest3()).toBe(43n);
        expect(await contract.getDestructuringTest3Const()).toBe(43n);
        expect(await contract.getDestructuringTest4()).toBe(43n);
        expect(await contract.getDestructuringTest4Const()).toBe(43n);
        expect(await contract.getDestructuringTest5()).toBe(43n);
        expect(await contract.getDestructuringTest5Const()).toBe(43n);
        expect(await contract.getDestructuringTest6()).toBe(6n);
        expect(await contract.getDestructuringTest6Const()).toBe(6n);
        expect(await contract.getDestructuringTest7()).toMatchObject<S1>({
            $$type: "S1",
            a: 3n,
            b: 2n,
            c: 1n,
        });
        expect(await contract.getDestructuringTest7Const()).toMatchObject<S1>({
            $$type: "S1",
            a: 3n,
            b: 2n,
            c: 1n,
        });
        expect(await contract.getDestructuringTest8()).toBe(42n);
        expect(await contract.getDestructuringTest8Const()).toBe(42n);
    });
});
