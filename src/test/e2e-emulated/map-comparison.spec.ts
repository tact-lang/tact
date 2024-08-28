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

        // Test edge case (https://github.com/tact-lang/tact/issues/196#issuecomment-2075088934)
        {
            const d1 = beginCell()
                .storeUint(2, 2) // long label
                .storeUint(8, 4) // key length
                .storeUint(1, 8) // key
                .storeBit(true) // value
                .endCell();

            const d2 = beginCell()
                .storeUint(0, 1) // short label
                .storeUint(0b111111110, 9) // key length
                .storeUint(1, 8) // key
                .storeBit(true) // value
                .endCell();

            let result = await treasure.send({
                to: contract.address,
                value: toNano("0.1"),
                body: beginCell()
                    .storeUint(
                        contract.abi.types!.find((t) => t.name === "Compare")!
                            .header!,
                        32,
                    )
                    .storeMaybeRef(d1)
                    .storeMaybeRef(d2)
                    .endCell(),
                init: contract.init,
            });

            expect(result.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                success: false,
                exitCode: 53111,
            });

            result = await treasure.send({
                to: contract.address,
                value: toNano("0.1"),
                body: beginCell()
                    .storeUint(
                        contract.abi.types!.find(
                            (t) => t.name === "CompareDeep",
                        )!.header!,
                        32,
                    )
                    .storeMaybeRef(d1)
                    .storeMaybeRef(d2)
                    .endCell(),
                init: contract.init,
            });

            expect(result.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                success: true,
            });

            // Just to make sure:
            const m1 = Dictionary.loadDirect(
                Dictionary.Keys.Uint(8),
                Dictionary.Values.Bool(),
                d1,
            );
            const m2 = Dictionary.loadDirect(
                Dictionary.Keys.Uint(8),
                Dictionary.Values.Bool(),
                d2,
            );
            expect(m1.size).toBe(1);
            expect(m2.size).toBe(1);
            expect(m1.get(1)).toBe(true);
            expect(m2.get(1)).toBe(true);
        }
    });
});
