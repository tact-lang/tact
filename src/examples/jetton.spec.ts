import { SampleJetton, SampleJetton_init } from "./output/jetton_SampleJetton";
import { createExecutorFromCode } from "ton-nodejs";
import { randomAddress } from "./utils/randomAddress";
import { toNano } from "ton";

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
        let res = await contract.send({ amount: toNano(1) }, { $$type: 'Mint', amount: 1000000n });
        console.warn(res);
    });
});