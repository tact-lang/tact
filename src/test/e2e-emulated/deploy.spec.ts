import type { Slice } from "@ton/core";
import {beginCell, toNano} from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { DeployParamsMsg} from "./contracts/output/deploy_DeployContract";
import {DeployContract} from "./contracts/output/deploy_DeployContract";
import "@ton/test-utils";

const counter = () => {
    let next = 0n;
    return () => next++;
};

const nextContractId = counter();

type DeployParams = {
    bounce: boolean;
    body: Slice;
    mode: bigint;
}



describe("Deploy() correctness", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<DeployContract>;

    async function checkCorrectness(params: DeployParams) {
        const deployedContractId = nextContractId();
        const msgToSend: DeployParamsMsg = {
            bounce: params.bounce,
            $$type: "DeployParamsMsg",
            body: params.body,
            contractNum: deployedContractId,
            mode: params.mode,
        }
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            msgToSend,
        );
        expect(sendResult.transactions).toHaveTransaction({
            from: contract.address,
            to: (await DeployContract.fromInit(deployedContractId)).address,
            deploy: true,
        });
    }

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await DeployContract.fromInit(nextContractId()));

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            beginCell().endCell().asSlice(),
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });
    it("should work with any bounce flag", async () => {
        await checkCorrectness({
            bounce: true,
            body: beginCell().storeStringTail("Hello world!").endCell().asSlice(),
            mode: 64n,
        });

        await checkCorrectness({
            bounce: false,
            body: beginCell().storeStringTail("Hello world!").endCell().asSlice(),
            mode: 64n,
        });
    });

    it("should work with any mode", async () => {
        await checkCorrectness({
            bounce: true,
            body: beginCell().storeStringTail("Hello world!").endCell().asSlice(),
            mode: 64n,
        });

        await checkCorrectness({
            bounce: true,
            body: beginCell().storeStringTail("Hello world!").endCell().asSlice(),
            mode: 128n,
        });
    });

    it("should work with any body", async () => {
       await checkCorrectness({
           bounce: false,
           body: beginCell().endCell().asSlice(), // empty slice
           mode: 64n,
       });
    });
});
