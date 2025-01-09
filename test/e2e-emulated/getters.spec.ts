import { beginCell, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Test, Test_getterMapping } from "./contracts/output/getters_Test";
import "@ton/test-utils";

describe("getters", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Test.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement getters correctly", async () => {
        // Getter name conflicts
        expect(await contract.getTestGetter()).toBe(1n);
        expect(await contract.gettest_getter()).toBe(2n);
        expect(await contract.getTest_getter()).toBe(3n);

        expect(Test_getterMapping["testGetter"]).toBe("getTestGetter");
        expect(Test_getterMapping["test_getter"]).toBe("gettest_getter");
        expect(Test_getterMapping["Test_getter"]).toBe("getTest_getter");

        // Passing `S` struct to getter
        expect(
            await contract.getStructAsInput({
                $$type: "S",
                a: 1n,
                b: 2n,
            }),
        ).toMatchSnapshot();

        // Returning `self` from getter
        expect(await contract.getContractData()).toMatchSnapshot();

        // Passing `SetIdAndData` message to getter
        expect(
            await contract.getMessageAsInput1({
                $$type: "SetIdAndData",
                id: 42n,
                data: beginCell().endCell(),
            }),
        ).toBe(42n);
        expect(
            await contract.getMessageAsInput2({
                $$type: "SetIdAndData",
                id: 42n,
                data: beginCell().endCell(),
            }),
        ).toMatchSnapshot();

        // Passing `Test` contract data to getter
        expect(
            await contract.getContractAsInput({
                $$type: "Test$Data",
                id: 123n,
                anotherData: beginCell().storeUint(123, 64).endCell(),
            }),
        ).toMatchSnapshot();

        expect(await contract.getMethodIdExpr()).toBe(true);
        expect(await contract.getMethodIdConst()).toBe(2n ** 14n);
        expect(await contract.getMethodIdMin()).toBe(true);
        expect(await contract.getMethodIdMax()).toBe(true);
    });
});
