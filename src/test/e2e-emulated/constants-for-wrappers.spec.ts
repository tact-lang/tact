import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import {
    ConstantTester,
    INT,
    STRING,
    STRING_WITH_QUOTES,
    BOOL,
    ADDR,
    CELL,
    SLICE,
    SIMPLE_STRUCT,
    NESTED_STRUCT,
} from "./contracts/output/constants-for-wrappers_ConstantTester";
import "@ton/test-utils";

describe("constants-for-wrappers", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<ConstantTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await ConstantTester.fromInit());

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

    it("should implement constants correctly", async () => {
        expect(await contract.getGlobalInt()).toEqual(INT);
        expect(await contract.getGlobalString()).toEqual(STRING);
        expect(await contract.getGlobalStringWithQuotes()).toEqual(
            STRING_WITH_QUOTES,
        );
        expect(await contract.getGlobalBool()).toEqual(BOOL);
        expect((await contract.getGlobalAddress()).toRawString()).toEqual(
            ADDR.toRawString(),
        );
        expect(await contract.getGlobalCell()).toEqualCell(CELL);
        expect(await contract.getGlobalSlice()).toEqualSlice(SLICE);
        expect(await contract.getGlobalSimpleStruct()).toEqual(SIMPLE_STRUCT);
        expect(await contract.getGlobalNestedStruct()).toEqual(NESTED_STRUCT);

        expect(await contract.getContractInt()).toEqual(ConstantTester.INT);
        expect(await contract.getContractString()).toEqual(
            ConstantTester.STRING,
        );
        expect(await contract.getContractStringWithQuotes()).toEqual(
            ConstantTester.STRING_WITH_QUOTES,
        );
        expect(await contract.getContractBool()).toEqual(ConstantTester.BOOL);
        expect((await contract.getContractAddress()).toRawString()).toEqual(
            ConstantTester.ADDR.toRawString(),
        );
        expect(await contract.getContractCell()).toEqualCell(
            ConstantTester.CELL,
        );
        expect(await contract.getContractSlice()).toEqualSlice(
            ConstantTester.SLICE,
        );
        expect(await contract.getContractSimpleStruct()).toEqual(
            ConstantTester.SIMPLE_STRUCT,
        );
        expect(await contract.getContractNestedStruct()).toEqual(
            ConstantTester.NESTED_STRUCT,
        );
    });
});
