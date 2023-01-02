import { toNano } from "ton-core";
import { ContractSystem, testAddress } from "ton-emulator";
import { SampleJetton } from './output/jetton_SampleJetton';

describe('jetton', () => {
    it('should deploy', async () => {

        // Create jetton
        let system = await ContractSystem.create();
        let owner = system.treasure('owner');
        let contract = system.open(await SampleJetton.fromInit(owner.address, null));

        // Mint
        await contract.send(owner, { value: toNano(1) }, { $$type: 'Mint', amount: toNano(1000000) });
        await system.run();

        // Check owner
        expect((await contract.getOwner()).toString()).toEqual(owner.address.toString());

        // Data
        let data = await contract.getGetJettonData();
        // console.warn(data);
    });
});