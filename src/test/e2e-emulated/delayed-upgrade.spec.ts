import type { ABIError, Cell } from "@ton/core";
import { Builder } from "@ton/core";
import { beginCell } from "@ton/core";
import { toNano } from "@ton/core";
import type { SandboxContract, Treasury, TreasuryContract } from "@ton/sandbox";
import { internal } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { SampleDelayedUpgradeContract } from "./contracts/output/delayed-upgrade_SampleDelayedUpgradeContract";
import { SampleDelayedUpgradeContractV2 } from "./contracts/output/delayed-upgrade-v2_SampleDelayedUpgradeContractV2";
import { SampleDelayedUpgradeContractV3 } from "./contracts/output/delayed-upgrade-v3_SampleDelayedUpgradeContractV3";
import "@ton/test-utils";
import type { Maybe } from "@ton/core/dist/utils/maybe";

describe("delayed upgrade", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let owner: SandboxContract<TreasuryContract>;
    let nonOwner: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<SampleDelayedUpgradeContract>;

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
            null,
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
            {
                code: newContract.init!.code,
                data: null,
            },
        );

        expect(nonOwnerResult.transactions).toHaveTransaction({
            from: nonOwner.address,
            to: contract.address,
            success: false,
            exitCode: 132,
        });
    });

    it("should implement delayed upgrade with timeout=0 of contract correctly", async () => {
        expect(await contract.getIsUpgradable()).toBe(true);

        // Check counter
        expect(Number(await contract.getCounter()) === 0).toBe(true);

        // Increment counter
        await contract.send(
            owner.getSender(),
            { value: toNano(1) },
            "increment",
        );

        // Check counter
        expect(Number(await contract.getCounter()) === 1).toBe(true);
        expect(Number(await contract.getVersion()) === 0).toBe(true);

        const newContract = await SampleDelayedUpgradeContractV2.fromInit(
            owner.address,
        );
        await initiateUpdateContract(owner.getSender(), 0n, {
            code: newContract.init!.code,
            data: null,
        });

        await confirmUpdateContract(owner.getSender());

        // Should add 100 instead of 1
        // Increment counter
        await contract.send(
            owner.getSender(),
            { value: toNano(1) },
            "increment",
        );

        // Check counter
        expect(Number(await contract.getCounter()) === 101).toBe(true);
        expect(Number(await contract.getVersion()) === 1).toBe(true);
        expect(await contract.getIsUpgradable()).toBe(true);
    });

    it("should implement delayed upgrade with timeout=1s of contract correctly", async () => {
        expect(await contract.getIsUpgradable()).toBe(true);

        // Check counter
        expect(Number(await contract.getCounter()) === 0).toBe(true);

        // Increment counter
        await contract.send(
            owner.getSender(),
            { value: toNano(1) },
            "increment",
        );

        // Check counter
        expect(Number(await contract.getCounter()) === 1).toBe(true);
        expect(Number(await contract.getVersion()) === 0).toBe(true);

        const newContract = await SampleDelayedUpgradeContractV2.fromInit(
            owner.address,
        );
        await initiateUpdateContract(owner.getSender(), 1n, {
            code: newContract.init!.code,
            data: null,
        });

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
        expect(Number(await contract.getCounter()) === 101).toBe(true);
        expect(Number(await contract.getVersion()) === 1).toBe(true);
        expect(await contract.getIsUpgradable()).toBe(true);
    });

    it("should fail delayed upgrade with timeout=1m without actual waiting correctly", async () => {
        const timeout = 60;
        const currentInitTime = await contract.getInitiatedAt();

        // Upgrade the code and measure initiatedAt
        const newContract = await SampleDelayedUpgradeContractV2.fromInit(
            owner.address,
        );
        await initiateUpdateContract(owner.getSender(), BigInt(timeout), {
            code: newContract.init!.code,
            data: null,
        });
        const updatedInitTime = await contract.getInitiatedAt();
        expect(updatedInitTime >= currentInitTime).toBe(true);

        // Timeout didn't elapse
        const now = Math.floor(Date.now() / 1000);
        expect(now - Number(updatedInitTime) < timeout).toBe(true);

        // Confirmation cannot be granted
        const earlyConfirmRes = await confirmUpdateContract(owner.getSender());

        const errorCodeCannotConfirmBeforeTimeout = findErrorCodeByMessage(
            contract.abi.errors,
            "DelayedUpgradable: Cannot confirm upgrade before timeout",
        );

        if (errorCodeCannotConfirmBeforeTimeout === null) {
            throw new Error("cannot find message");
        }

        expect(earlyConfirmRes.transactions).toHaveTransaction({
            from: owner.address,
            to: contract.address,
            aborted: true,
            exitCode: errorCodeCannotConfirmBeforeTimeout,
        });
    });

    it("should implement delayed upgrade of contract with new receiver correctly", async () => {
        // NOTE: After the upgrade, the new version counter has an int32 type, not uint32
        const newContract = await SampleDelayedUpgradeContractV3.fromInit(
            owner.address,
        );
        await initiateUpdateContract(owner.getSender(), 1n, {
            code: newContract.init!.code,
            data: null,
        });

        // imitate actual timeout
        await new Promise((resolve) => setTimeout(resolve, MILLISECONDS_1S));

        await confirmUpdateContract(owner.getSender());

        // Decrement counter with new receiver
        await sendRawMessage(
            beginCell().storeUint(0, 32).storeStringTail("decrement").endCell(),
        );

        // Check counter
        expect(Number(await contract.getCounter()) === -1).toBe(true);
        expect(Number(await contract.getVersion()) === 1).toBe(true);
        expect(await contract.getIsUpgradable()).toBe(true);
    });

    it("should implement upgrade of simple contract with new data correctly", async () => {
        const builder = new Builder();
        builder.storeUint(1, 1); // we need to reload on message so we set 1 here
        builder.storeInt(100, 32); // version
        builder.storeInt(0, 257); // initiated_at

        builder.storeUint(537627911, 32); // message opcode
        builder.storeBit(false); // upgrade_info.code
        builder.storeBit(false); // upgrade_info.data
        builder.storeInt(0, 257); // upgrade_info.timeout

        builder.storeAddress(owner.address);
        builder.storeUint(999, 32); // counter

        const newData = builder.endCell();

        await initiateUpdateContract(owner.getSender(), 0n, {
            code: null,
            data: newData,
        });
        await confirmUpdateContract(owner.getSender());

        // Check counter
        expect(Number(await contract.getCounter()) === 999).toBe(true);
        expect(Number(await contract.getVersion()) === 100).toBe(true);
        expect(await contract.getIsUpgradable()).toBe(true);
    });

    /**
     * @param timeout seconds
     */
    async function initiateUpdateContract(
        sender: Treasury,
        timeout: bigint,
        init?: { code: Cell | null; data: Cell | null },
    ) {
        if (init === undefined) {
            throw new Error("invalid argument");
        }

        // Update code
        return await contract.send(
            sender,
            { value: toNano(1) },
            {
                $$type: "Upgrade",
                code: init.code,
                data: init.data,
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
