import { beginCell, toNano } from '@ton/core';
import { ContractSystem, Verbosity } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { SampleJetton } from './bugs/output/bugs_SampleJetton';
import { JettonDefaultWallet } from './bugs/output/bugs_JettonDefaultWallet';

describe('bugs', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should deploy contract correctly', async () => {

        // Init
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await SampleJetton.fromInit(treasure.address, beginCell().endCell(), toNano('100')));
        let target = system.open(await JettonDefaultWallet.fromInit(contract.address, treasure.address));
        let logger = system.log(target.address);
        let tracker = system.track(target.address);
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Mint', receiver: treasure.address, amount: toNano('10') });
        await system.run();

        // console.warn(logger.collect());
        expect(tracker.collect()).toMatchSnapshot();
    });
});