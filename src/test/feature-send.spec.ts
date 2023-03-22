import { toNano } from 'ton-core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { SendTester } from './features/output/send_SendTester';

describe('feature-send', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should send reply correctly', async () => {

        // Init
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await SendTester.fromInit());
        let tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();

        await contract.send(treasure, { value: toNano('10') }, 'Hello');
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
});