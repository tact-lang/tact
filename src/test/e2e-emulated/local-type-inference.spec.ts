import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { LocalTypeInferenceTester } from "./contracts/output/local-type-inference_LocalTypeInferenceTester";
import "@ton/test-utils";

describe("local-type-inference", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<LocalTypeInferenceTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await LocalTypeInferenceTester.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should automatically set types for let statements", async () => {
        expect(await contract.getTest1()).toStrictEqual(1n);
        expect(await contract.getTest2()).toStrictEqual(2n);
        expect((await contract.getTest3()).toRawString()).toBe(
            contract.address.toRawString(),
        );
        expect((await contract.getTest4()).toRawString()).toBe(
            contract.address.toRawString(),
        );
        expect(await contract.getTest5()).toStrictEqual(true);
        expect((await contract.getTest6()).toString()).toStrictEqual(
            beginCell().storeUint(123, 64).endCell().asSlice().toString(),
        );
        expect((await contract.getTest7()).toString()).toStrictEqual(
            beginCell().storeUint(123, 64).endCell().toString(),
        );
        expect((await contract.getTest8()).asCell().toString()).toStrictEqual(
            beginCell().storeUint(123, 64).endCell().toString(),
        );
        expect(await contract.getTest9()).toStrictEqual("hello");
        expect(await contract.getTest10()).toStrictEqual("hello");

        const test11 = await contract.getTest11();
        expect(test11.code.toString()).toStrictEqual(
            contract.init?.code.toString(),
        );
        expect(test11.data.toString()).toStrictEqual(
            contract.init?.data.toString(),
        );

        expect(await contract.getTest14()).toStrictEqual({
            $$type: "MyStruct",
            x: 1n,
            y: 2n,
        });
        expect(await contract.getTest15()).toStrictEqual({
            $$type: "MyStruct",
            x: 1n,
            y: 2n,
        });
        expect(await contract.getTest16()).toBeNull();
        expect(await contract.getTest17()).toBeNull();
        expect(await contract.getTest18()).toBe(2n);
        expect(await contract.getTest19()).toBeNull();

        // Test contract's ABI
        expect(contract.abi).toMatchSnapshot();
    });
});
