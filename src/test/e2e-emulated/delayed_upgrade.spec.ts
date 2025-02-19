import type { ABIError, Cell } from "@ton/core";
import { beginCell } from "@ton/core";
import { toNano } from "@ton/core";
import type { SandboxContract, Treasury, TreasuryContract } from "@ton/sandbox";
import { internal } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { SampleDelayedUpgradeContract } from "./contracts/output/delayed_upgrade_SampleDelayedUpgradeContract";
import { SampleDelayedUpgradeContractV2 } from "./contracts/output/delayed_upgrade_v2_SampleDelayedUpgradeContractV2";
import { SampleDelayedUpgradeContractV3 } from "./contracts/output/delayed_upgrade_v3_SampleDelayedUpgradeContractV3";
import "@ton/test-utils";
import type { Maybe } from "@ton/core/dist/utils/maybe";

describe("delayed upgrade", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let owner: SandboxContract<TreasuryContract>;
    let nonOwner: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<SampleDelayedUpgradeContract>;

    const NANOSECONDS_1S = 1_000_000_000n;
    const MILLISECONDS_1S = 1_000;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        owner = await blockchain.treasury("owner");
        nonOwner = await blockchain.treasury("non-owner");
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(
            await SampleDelayedUpgradeContract.fromInit(owner.address),
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
        const newContract = await SampleDelayedUpgradeContractV2.fromInit(
            owner.address,
        );
        const nonOwnerResult = await initiateUpdateContract(
            nonOwner.getSender(),
            0n,
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

    it("should implement delayed upgrade with timeout=0 of contract correctly", async () => {
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

        const newContract = await SampleDelayedUpgradeContractV2.fromInit(
            owner.address,
        );
        await initiateUpdateContract(
            owner.getSender(),
            0n,
            newContract.init?.code,
        );

        await confirmUpdateContract(owner.getSender());

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

    it("should implement delayed upgrade with timeout=1s of contract correctly", async () => {
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

        const newContract = await SampleDelayedUpgradeContractV2.fromInit(
            owner.address,
        );
        await initiateUpdateContract(
            owner.getSender(),
            NANOSECONDS_1S,
            newContract.init?.code,
        );

        // imitate actual timeout
        await new Promise((resolve) => setTimeout(resolve, MILLISECONDS_1S));

        await confirmUpdateContract(owner.getSender());

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

    it("should fail delayed upgrade with timeout=1m without actual waiting correctly", async () => {
        const newContract = await SampleDelayedUpgradeContractV2.fromInit(
            owner.address,
        );
        await initiateUpdateContract(
            owner.getSender(),
            60n * NANOSECONDS_1S,
            newContract.init?.code,
        );

        const earlyConfirmRes = await confirmUpdateContract(owner.getSender());

        const errorCodeForInvalidSender = findErrorCodeByMessage(
            contract.abi.errors,
            "DelayedUpgradable: Cannot confirm upgrade before timeout",
        );

        if (errorCodeForInvalidSender === null) {
            throw new Error("cannot find message");
        }

        expect(earlyConfirmRes.transactions).toHaveTransaction({
            from: owner.address,
            to: contract.address,
            aborted: true,
            exitCode: errorCodeForInvalidSender,
        });
    });

    it("should implement delayed upgrade of contract with new receiver correctly", async () => {
        // Note, in new version counter has int32 type, not uint32!
        const newContract = await SampleDelayedUpgradeContractV3.fromInit(
            owner.address,
        );
        await initiateUpdateContract(
            owner.getSender(),
            NANOSECONDS_1S,
            newContract.init?.code,
        );

        // imitate actual timeout
        await new Promise((resolve) => setTimeout(resolve, MILLISECONDS_1S));

        await confirmUpdateContract(owner.getSender());

        // Decrement counter with new receiver
        await sendRawMessage(
            beginCell().storeUint(0, 32).storeStringTail("decrement").endCell(),
        );

        // Check counter
        expect(await contract.getCounter()).toEqual(-1n);
        expect(await contract.getVersion()).toEqual(1n);
        expect(await contract.getIsUpgradable()).toEqual(true);
    });

    async function initiateUpdateContract(
        sender: Treasury,
        timeout: bigint,
        code: Cell | undefined,
    ) {
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
                timeout: timeout,
            },
        );
    }

    async function confirmUpdateContract(sender: Treasury) {
        return await contract.send(
            sender,
            { value: toNano(1) },
            {
                $$type: "Confirm",
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
