import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { A } from './features/output/ordering_A';

describe('feature-ordering', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement constructor ordering correctly', async () => {

        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await A.fromInit(treasure.address));
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();

        // Check order
        const res = await contract.getCreate(0n);
        expect(res.v1).toBe(3n);
        expect(res.v2).toBe(2n);
        expect(res.v3).toBe(1n);
    });
});