import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Self } from "./contracts/output/initof_Self";
import { Parent } from "./contracts/output/initof_Parent";
import { TestInit } from "./contracts/output/initof-2_TestInit";
import { A } from "./contracts/output/initof-3_A";
import "@ton/test-utils";

describe("initOf", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
    });

    it("should implement initOf correctly - 1", async () => {
        const contract = blockchain.openContract(await Self.fromInit());

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(await contract.getTestInitOfAddress()).toEqualAddress(
            await contract.getTestMyAddress(),
        );
    });

    it("should implement initOf correctly - 2", async () => {
        const contract = blockchain.openContract(await Parent.fromInit());

        await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(await contract.getTestInitOfAddressChild()).toEqualAddress(
            await contract.getTestMyAddressChild(),
        );
    });

    it("should implement initOf correctly - 3", async () => {
        const contract = blockchain.openContract(await TestInit.fromInit());

        const result = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
        );

        const logs = result.transactions[1]!.debugLogs;

        expect(logs).toContain("init@TestInit-SUCCESS");
        expect(logs).not.toContain("ERROR@TestInit");
    });

    it("should implement initOf correctly - 4", async () => {
        const contract = blockchain.openContract(await A.fromInit());

        const result = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "aa",
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });
    });
});
