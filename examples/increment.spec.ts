import { IncrementContract } from "./output/increment_IncrementContract";
import { Blockchain } from "@ton/sandbox";
import { toNano } from "@ton/core";
import { Tracker } from "../src/tracker";

describe("increment", () => {
    it("should deploy", async () => {
        // Create wallet
        const blockchain = await Blockchain.create();
        const treasure = await blockchain.treasury("treasure");
        const contract = blockchain.openContract(
            await IncrementContract.fromInit(),
        );
        const tracker = new Tracker();
        tracker.track(contract);

        tracker.parse(
            await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "Deploy", queryId: 0n },
            ),
        );
        expect(tracker.collect()).toMatchSnapshot();

        // Send internal message
        tracker.parse(
            await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                { $$type: "Increment", key: 0n, value: -1232n },
            ),
        );
        expect(tracker.collect()).toMatchSnapshot();
    });
});
