import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { SendTester } from './features/output/send_SendTester';

describe('feature-send', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should send reply correctly', async () => {

        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await SendTester.fromInit());
        const tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();

        await contract.send(treasure, { value: toNano('10') }, 'Hello');
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
    it('should bounce on unknown message', async () => {

        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await SendTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();

        // Test
        const tracker = system.track(contract);
        await system.provider(contract).internal(treasure, { value: toNano('10'), body: 'Unknown string' });
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
});