import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./contracts/output/initOf-in-function-called-in-init_Test";
import { Test as Test2 } from "./contracts/output/initOf-in-function-called-in-init-2_Test";
import { MasterV0 } from "./contracts/output/initOf-in-function-called-in-init_MasterV0";
import { MasterV0 as MasterV02 } from "./contracts/output/initOf-in-function-called-in-init-2_MasterV0";
import "@ton/test-utils";

describe("initOf inside init via global function", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;
    let contract2: SandboxContract<Test2>;
    let childContract: SandboxContract<MasterV0>;
    let childContract2: SandboxContract<MasterV02>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await Test.fromInit());
        contract2 = blockchain.openContract(await Test2.fromInit());
        childContract = blockchain.openContract(await MasterV0.fromInit());
        childContract2 = blockchain.openContract(await MasterV02.fromInit());

        const result = await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            null, // No specific message, sending a basic transfer
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        const result2 = await contract2.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            null, // No specific message, sending a basic transfer
        );

        expect(result2.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract2.address,
            success: true,
            deploy: true,
        });
    });

    it("should set owner with global function correctly", async () => {
        expect(await contract.getOwner()).toEqualAddress(childContract.address);
        expect(await contract2.getOwner()).toEqualAddress(
            childContract2.address,
        );
    });
});
