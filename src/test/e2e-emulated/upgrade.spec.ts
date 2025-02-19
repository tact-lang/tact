import type { ABIError, Cell } from "@ton/core";
import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, Treasury, TreasuryContract } from "@ton/sandbox";
import { internal } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { SampleUpgradeContract } from "./contracts/output/upgrade_SampleUpgradeContract";
import { SampleUpgradeContract as SampleUpgradeContractV2 } from "./contracts/output/upgrade_v2_SampleUpgradeContract";
import { SampleUpgradeContractV3 } from "./contracts/output/upgrade_v3_SampleUpgradeContractV3";
import "@ton/test-utils";
import type { Maybe } from "@ton/core/dist/utils/maybe";

describe("upgrade", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let owner: SandboxContract<TreasuryContract>;
    let nonOwner: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<SampleUpgradeContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");
        nonOwner = await blockchain.treasury("non-owner");
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(
            await SampleUpgradeContract.fromInit(owner.address),
        );

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
    });

    it("non owner cannot update contract", async () => {
        const newContract = await SampleUpgradeContractV2.fromInit(
            owner.address,
        );
        const nonOwnerResult = await updateContract(
            nonOwner.getSender(),
            newContract.init?.code,
        );
        const errorCodeForInvalidSender = findErrorCodeByMessage(
            contract.abi.errors,
            "Upgradable: Sender is not a contract owner",
        );

        if (errorCodeForInvalidSender === null) {
            throw new Error("cannot find message");
        }

        expect(nonOwnerResult.transactions).toHaveTransaction({
            from: nonOwner.address,
            to: contract.address,
            success: false,
            exitCode: errorCodeForInvalidSender,
        });
    });

    it("should implement upgrade of simple contract correctly", async () => {
        expect(await contract.getIsUpgradable()).toEqual(true);

        // Check counter
        expect(await contract.getCounter()).toEqual(0n);

        // Increment counter
        await contract.send(
            owner.getSender(),
            { value: toNano(1) },
            "increment",
        );

        // Check counter
        expect(await contract.getCounter()).toEqual(1n);
        expect(await contract.getVersion()).toEqual(0n);

        const newContract = await SampleUpgradeContractV2.fromInit(
            owner.address,
        );
        await updateContract(owner.getSender(), newContract.init?.code);

        // Should add 100 instead of 1
        // Increment counter
        await contract.send(
            owner.getSender(),
            { value: toNano(1) },
            "increment",
        );

        // Check counter
        expect(await contract.getCounter()).toEqual(101n);
        expect(await contract.getVersion()).toEqual(1n);
        expect(await contract.getIsUpgradable()).toEqual(true);
    });

    it("should implement upgrade of simple contract with new receiver correctly", async () => {
        // Note, in new version counter has int32 type, not uint32!
        const newContract = await SampleUpgradeContractV3.fromInit(
            owner.address,
        );
        await updateContract(owner.getSender(), newContract.init?.code);

        // Decrement counter with new receiver
        await sendRawMessage(
            beginCell().storeUint(0, 32).storeStringTail("decrement").endCell(),
        );

        // Check counter
        expect(await contract.getCounter()).toEqual(-1n);
        expect(await contract.getVersion()).toEqual(1n);
        expect(await contract.getIsUpgradable()).toEqual(true);
    });

    async function updateContract(sender: Treasury, code: Cell | undefined) {
        if (code === undefined) {
            throw new Error("invalid argument");
        }

        // Update code
        return await contract.send(
            sender,
            { value: toNano(1) },
            {
                $$type: "Upgrade",
                code: code,
                data: null,
                timeout: 0n,
            },
        );
    }

    async function sendRawMessage(body: Cell) {
        const cont = await blockchain.getContract(contract.address);
        await cont.receiveMessage(
            internal({
                from: owner.getSender().address,
                to: contract.address,
                bounced: false,
                body: body,
                value: toNano("0.95"),
            }),
        );
    }

    function findErrorCodeByMessage(
        errors: Maybe<Record<number, ABIError>>,
        errorMessage: string,
    ) {
        if (!errors) return null;
        for (const [code, error] of Object.entries(errors)) {
            if (error.message === errorMessage) {
                return parseInt(code, 10);
            }
        }
        return null;
    }
});
