import { toNano } from "ton-core";
import { ContractSystem, testAddress } from "ton-emulator";
import { DDDD } from './bugs/output/bug_18_DDDD';

describe('bugs', () => {
    it('not have a bug #18', async () => {
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await DDDD.fromInit(testAddress('1'), testAddress('3'), testAddress('2')));
        let tracker = system.track(contract.address);
        await contract.send(treasure, { value: toNano('10') }, null);
        await system.run();
        expect(tracker.collect()).toMatchSnapshot();
    });
});