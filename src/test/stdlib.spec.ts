import { beginCell, toNano } from "@ton/core";
import { ContractSystem } from "@tact-lang/emulator";
import { StdlibTest } from './contracts/output/stdlib_StdlibTest';

describe('stdlib', () => {
    it('should execute slice methods correctly', async () => {

        // Create and deploy contract
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await StdlibTest.fromInit());
        await contract.send(treasure, { value: toNano('10') }, null);
        await system.run();
        
        // Execute slice methods
        let slice = beginCell()
            .storeBit(1)
            .storeBit(1)
            .storeRef(beginCell().storeBit(1).endCell())
            .endCell();
        let bits = (await contract.getSliceBits(slice));
        let refs = (await contract.getSliceRefs(slice));
        let empty = (await contract.getSliceEmpty(slice));
        expect(bits).toBe(2n);
        expect(refs).toBe(1n);
        expect(empty).toBe(false);
    });
});