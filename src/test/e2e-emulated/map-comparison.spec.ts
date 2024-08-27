import { Address, beginCell, Cell, Dictionary, toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { MapComparisonTestContract } from "./contracts/output/map-comparison_MapComparisonTestContract";
import "@ton/test-utils";

describe("map-comparison", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<MapComparisonTestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await MapComparisonTestContract.fromInit(),
        );

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

    it("should implement map comparison correctly", async () => {
        // Test Int Int - Equal
        {
            const m1: Dictionary<bigint, bigint> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.BigInt(256),
            );
            m1.set(1n, 2n);
            m1.set(3n, 4n);
            const m2: Dictionary<bigint, bigint> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.BigInt(256),
            );
            m2.set(1n, 2n);
            m2.set(3n, 4n);
            expect(await contract.getCompareIntInt(m1, m2)).toBe(true);
        }

        // Test Int Int - Not Equal
        {
            const m1: Dictionary<bigint, bigint> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.BigInt(256),
            );
            m1.set(1n, 2n);
            m1.set(3n, 4n);
            const m2: Dictionary<bigint, bigint> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.BigInt(256),
            );
            m2.set(1n, 2n);
            m2.set(3n, 5n);
            expect(await contract.getCompareIntInt(m1, m2)).toBe(false);
        }

        // Test Int Cell - Equal
        {
            const m1: Dictionary<bigint, Cell> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Cell(),
            );
            m1.set(1n, beginCell().storeUint(123, 64).endCell());
            m1.set(3n, beginCell().storeUint(456, 64).endCell());
            const m2: Dictionary<bigint, Cell> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Cell(),
            );
            m2.set(1n, beginCell().storeUint(123, 64).endCell());
            m2.set(3n, beginCell().storeUint(456, 64).endCell());
            expect(await contract.getCompareIntCell(m1, m2)).toBe(true);
        }

        // Test Int Cell - Not Equal
        {
            const m1: Dictionary<bigint, Cell> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Cell(),
            );
            m1.set(1n, beginCell().storeUint(123, 64).endCell());
            m1.set(3n, beginCell().storeUint(456, 64).endCell());
            const m2: Dictionary<bigint, Cell> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Cell(),
            );
            m2.set(1n, beginCell().storeUint(123, 64).endCell());
            m2.set(3n, beginCell().storeUint(457, 64).endCell());
            expect(await contract.getCompareIntCell(m1, m2)).toBe(false);
        }

        // Test Int Address - Equal
        {
            const m1: Dictionary<bigint, Address> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Address(),
            );
            m1.set(
                1n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000002",
                ),
            );
            m1.set(
                3n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000004",
                ),
            );
            const m2: Dictionary<bigint, Address> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Address(),
            );
            m2.set(
                1n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000002",
                ),
            );
            m2.set(
                3n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000004",
                ),
            );
            expect(await contract.getCompareIntAddress(m1, m2)).toBe(true);
        }

        // Test Int Address - Not Equal
        {
            const m1: Dictionary<bigint, Address> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Address(),
            );
            m1.set(
                1n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000002",
                ),
            );
            m1.set(
                3n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000004",
                ),
            );
            const m2: Dictionary<bigint, Address> = Dictionary.empty(
                Dictionary.Keys.BigInt(256),
                Dictionary.Values.Address(),
            );
            m2.set(
                1n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000002",
                ),
            );
            m2.set(
                3n,
                Address.parseRaw(
                    "0:0000000000000000000000000000000000000000000000000000000000000005",
                ),
            );
            expect(await contract.getCompareIntAddress(m1, m2)).toBe(false);
        }
    });
});
