import { toNano } from 'ton-core';
import { ContractSystem } from 'ton-emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { Debug } from './features/output/debug_Debug';

describe('feature-debug', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should dump values correctly', async () => {

        // Init
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await Debug.fromInit());
        let logger = system.log(contract.address);
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();


        logger.reset();
        await contract.send(treasure, { value: toNano('10') }, 'Debug');
        await system.run();


        let res = logger.collect() as string;
        console.warn(res);
    });
});