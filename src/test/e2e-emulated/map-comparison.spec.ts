import { Address, beginCell, Cell, Dictionary, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { __DANGER_resetNodeId } from "../../grammar/ast";
import { MapComparisonTestContract } from "./contracts/output/map-comparison_MapComparisonTestContract";

describe("map-comparison", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it("should implement map comparison correctly", async () => {
        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(
            await MapComparisonTestContract.fromInit(),
        );
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Test

        {
            // Int Int - Equal
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

        {
            // Int Int - Not Equal
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

        {
            // Int Cell - Equal
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

        {
            // Int Cell - Not Equal
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

        {
            // Int Address - Equal
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

        {
            // Int Address - Not Equal
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
