import { SampleJetton, SampleJetton_init } from "./output/jetton_SampleJetton";
import { createExecutorFromCode } from "ton-nodejs";
import { randomAddress } from "./utils/randomAddress";
import { toNano } from "ton";
import BN from "bn.js";

describe('jetton', () => {
    it('should deploy', async () => {

        // Create jetton
        let owner = randomAddress(0, 'jetton-owner');
        let init = await SampleJetton_init(owner, null);
        let executor = await createExecutorFromCode(init);
        let contract = new SampleJetton(executor);

        // Check owner
        expect((await contract.getOwner()).toFriendly()).toEqual(owner.toFriendly());

        // Mint
        let res = await contract.send({ amount: toNano(1) }, { $$type: 'Mint', amount: new BN(1000000) });
        console.warn(res);

        // Data
        let data = await contract.getGetJettonData();
        console.warn(data);
    });
});