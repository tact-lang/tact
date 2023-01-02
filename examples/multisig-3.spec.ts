import { toNano } from "ton-core";
import { ContractSystem } from "ton-emulator";
import { MultisigContract } from "./output/multisig-3_MultisigContract";

describe('muiltisig-3', () => {
    it('should deploy', async () => {

        // Init contract
        let key1 = 1n;
        let key2 = 1n;
        let key3 = 1n;
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        let contract = system.open(await MultisigContract.fromInit(key1, key2, key3));
        await contract.send(treasure, { value: toNano('10') }, 'Deploy');
        await system.run();

        // Check keys
        expect(await contract.getKey1()).toBe(key1);
        expect(await contract.getKey2()).toBe(key2);
        expect(await contract.getKey3()).toBe(key3);
    });
});