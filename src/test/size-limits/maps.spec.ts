import { toNano } from "@ton/core";
import {
    Blockchain,
    BlockchainTransaction,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import "@ton/test-utils";

// Number of entries causing exit code 50 is in interval: [32700, 32800)
import { MapIntInt } from "./contracts/output/map-size-limits_MapIntInt";
const shouldTestIntInt: boolean = false;

// So far (exit code -14), max number of entries recorded is in interval: [507800, 507900)
import { MapIntBool } from "./contracts/output/map-size-limits_MapIntBool";
const shouldTestIntBool: boolean = false;

// So far (exit code -14), max number of entries recorded is in interval: [262000, 262100)
import { MapIntCell } from "./contracts/output/map-size-limits_MapIntCell";
const shouldTestIntCell: boolean = false;

// So far (exit code -14), max number of entries recorded is in interval: [507800, 507900)
import { MapIntAddress } from "./contracts/output/map-size-limits_MapIntAddress";
const shouldTestIntAddress: boolean = false;

// So far (exit code -14), max number of entries recorded is in interval: [196500, 196600)
import { MapIntStruct } from "./contracts/output/map-size-limits_MapIntStruct";
const shouldTestIntStruct: boolean = false;

// So far (exit code -14), max number of entries recorded is in interval: [196500, 196600)
import { MapIntMessage } from "./contracts/output/map-size-limits_MapIntMessage";
const shouldTestIntMessage: boolean = false;

// Tests to find the limits of map sizes
describe("map size limits", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure", {
            resetBalanceIfZero: true, // ← doesn't seem to work
        });
    });

    it("should test map<Int, Int>", async () => {
        const contract = blockchain.openContract(await MapIntInt.fromInit());
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (shouldTestIntInt) {
            const entries = 60_000;
            const batch = 100;
            for (let i = 0; i < entries; i += batch) {
                const tx = (
                    await contract.send(
                        treasure.getSender(),
                        { value: toNano("1") },
                        {
                            $$type: "AddIntInt",
                            batchSize: BigInt(batch),
                            startingValue: BigInt(i),
                        },
                    )
                ).transactions[1]!;
                if (shouldStop(tx)) {
                    console.log(tx.description);
                    console.log(i);
                    break;
                }
            }
        }
    });

    it("should test map<Int, Bool>", async () => {
        const contract = blockchain.openContract(await MapIntBool.fromInit());
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (shouldTestIntBool) {
            const entries = 10_000_000;
            const batch = 100;
            for (let i = 0; i < entries; i += batch) {
                const tx: BlockchainTransaction = (
                    await contract.send(
                        treasure.getSender(),
                        { value: toNano("1") },
                        {
                            $$type: "AddIntBool",
                            batchSize: BigInt(batch),
                            startingKey: BigInt(i),
                        },
                    )
                ).transactions[1]!;
                if (shouldStop(tx)) {
                    console.log(tx.description);
                    console.log(i);
                    break;
                }
            }
        }
    });

    it("should test map<Int, Cell>", async () => {
        const contract = blockchain.openContract(await MapIntCell.fromInit());
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (shouldTestIntCell) {
            const entries = 10_000_000;
            const batch = 100;
            for (let i = 0; i < entries; i += batch) {
                const tx: BlockchainTransaction = (
                    await contract.send(
                        treasure.getSender(),
                        { value: toNano("1") },
                        {
                            $$type: "AddIntCell",
                            batchSize: BigInt(batch),
                            startingKey: BigInt(i),
                        },
                    )
                ).transactions[1]!;
                if (shouldStop(tx)) {
                    console.log(tx.description);
                    console.log(i);
                    break;
                }
            }
        }
    });

    it("should test map<Int, Address>", async () => {
        const contract = blockchain.openContract(
            await MapIntAddress.fromInit(),
        );
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (shouldTestIntAddress) {
            const entries = 10_000_000;
            const batch = 100;
            for (let i = 0; i < entries; i += batch) {
                const tx: BlockchainTransaction = (
                    await contract.send(
                        treasure.getSender(),
                        { value: toNano("1") },
                        {
                            $$type: "AddIntAddress",
                            batchSize: BigInt(batch),
                            startingKey: BigInt(i),
                        },
                    )
                ).transactions[1]!;
                if (shouldStop(tx)) {
                    console.log(tx.description);
                    console.log(i);
                    break;
                }
            }
        }
    });

    it("should test map<Int, Struct>", async () => {
        const contract = blockchain.openContract(await MapIntStruct.fromInit());
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (shouldTestIntStruct) {
            const entries = 10_000_000;
            const batch = 100;
            for (let i = 0; i < entries; i += batch) {
                const tx: BlockchainTransaction = (
                    await contract.send(
                        treasure.getSender(),
                        { value: toNano("1") },
                        {
                            $$type: "AddIntStruct",
                            batchSize: BigInt(batch),
                            startingKey: BigInt(i),
                        },
                    )
                ).transactions[1]!;
                if (shouldStop(tx)) {
                    console.log(tx.description);
                    console.log(i);
                    break;
                }
            }
        }
    });

    it("should test map<Int, Message>", async () => {
        const contract = blockchain.openContract(
            await MapIntMessage.fromInit(),
        );
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("100000") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (shouldTestIntMessage) {
            const entries = 10_000_000;
            const batch = 100;
            for (let i = 0; i < entries; i += batch) {
                const tx: BlockchainTransaction = (
                    await contract.send(
                        treasure.getSender(),
                        { value: toNano("1") },
                        {
                            $$type: "AddIntMessage",
                            batchSize: BigInt(batch),
                            startingKey: BigInt(i),
                        },
                    )
                ).transactions[1]!;
                if (shouldStop(tx)) {
                    console.log(tx.description);
                    console.log(i);
                    break;
                }
            }
        }
    });
});

/** Helper function for checking whether the test case should be stopped */
function shouldStop(tx: BlockchainTransaction): boolean {
    if (
        tx.description.type === "generic" &&
        tx.description.computePhase.type === "vm" &&
        (tx.description.computePhase.exitCode !== 0 ||
            tx.description.actionPhase?.resultCode !== 0)
    ) {
        return true;
    }
    return false;
}
