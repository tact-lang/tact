import { beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { StdlibTest } from "./contracts/output/stdlib_StdlibTest";

describe("stdlib", () => {
    it("should execute slice methods correctly", async () => {
        // Create and deploy contract
        const system = await ContractSystem.create();
        const treasure = system.treasure("treasure");
        const contract = system.open(await StdlibTest.fromInit());
        await contract.send(treasure, { value: toNano("10") }, null);
        await system.run();

        // Execute slice methods
        const slice = beginCell()
            .storeBit(1)
            .storeBit(1)
            .storeRef(beginCell().storeBit(1).endCell())
            .endCell()
            .asSlice();
        expect(await contract.getSliceBits(slice)).toBe(2n);
        expect(await contract.getSliceRefs(slice)).toBe(1n);
        expect(await contract.getSliceEmpty(slice)).toBe(false);
        expect(await contract.getLoadBool(slice)).toBe(true);
        expect(await contract.getLoadBit(slice)).toBe(true);
        expect(
            (await contract.getStoreBool(beginCell(), true))
                .endCell()
                .toString(),
        ).toBe(beginCell().storeBit(true).endCell().toString());
        expect(
            (await contract.getStoreBit(beginCell(), true))
                .endCell()
                .toString(),
        ).toBe(beginCell().storeBit(true).endCell().toString());
    });
});
