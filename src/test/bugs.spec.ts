import { beginCell, toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { SampleJetton } from './bugs/output/bugs_SampleJetton';
import { JettonDefaultWallet } from './bugs/output/bugs_JettonDefaultWallet';

describe('bugs', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should deploy contract correctly', async () => {

        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await SampleJetton.fromInit(treasure.address, beginCell().endCell(), toNano('100')));
        const target = system.open(await JettonDefaultWallet.fromInit(contract.address, treasure.address));
        const tracker = system.track(target.address);
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Mint', receiver: treasure.address, amount: toNano('10') });
        await system.run();

        expect(tracker.collect()).toMatchSnapshot();
    });
});