import { toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { SampleContract2 } from './features/output/bounced-routing_SampleContract2';
import { SampleContract } from './features/output/bounced-routing_SampleContract';

describe('feature-strings', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should bounce based on type router', async () => {

        // Init
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        const contract = system.open(await SampleContract.fromInit());
        const contract2 = system.open(await SampleContract2.fromInit());

        // Deploy
        await contract.send(treasure, { value: toNano('10') }, null);
        await contract2.send(treasure, { value: toNano('10') }, null);
        await system.run();

        expect(await contract.getAmount()).toBe(100n)

        await contract.send(treasure, { value: toNano('10') }, {
            $$type: 'EntryFirst',
            amountToAdd: 10n,
            toAddress: contract2.address
        });
        await system.run()

        expect(await contract.getAmount()).toBe(98n);

        await contract.send(treasure, { value: toNano('10') }, {
            $$type: 'EntrySecond',
            amountToAdd: 10n,
            toAddress: contract2.address
        });
        await system.run()
        expect(await contract.getAmount()).toBe(94n);
    });
});