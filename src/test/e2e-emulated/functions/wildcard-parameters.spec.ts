import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/wildcard-parameters_Test";
import "@ton/test-utils";

describe("wildcard-parameters", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Test.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should run get methods correctly", async () => {
        expect(Number(await contract.getContractAdd())).toEqual(0);
        expect(Number(await contract.getGlobalAdd())).toEqual(0);
        expect(Number(await contract.getGlobalAsmAdd())).toEqual(3);

        expect(Number(await contract.getGlobalAddThreeWildcards())).toEqual(0);
        expect(Number(await contract.getGlobalAddMixedParams())).toEqual(3);
        expect(Number(await contract.getGlobalAddMixedParams2())).toEqual(3);
        expect(Number(await contract.getGlobalAddMixedParams3())).toEqual(3);
        expect(Number(await contract.getGlobalAsmAddThreeWildcards())).toEqual(
            3,
        );
        expect(Number(await contract.getGlobalAsmAddMixedParams())).toEqual(3);
        expect(Number(await contract.getGlobalAsmAddMixedParams2())).toEqual(3);

        expect(Number(await contract.getContractAddThreeWildcards())).toEqual(
            0,
        );
        expect(Number(await contract.getContractAddMixedParams())).toEqual(4);
        expect(Number(await contract.getContractAddMixedParams2())).toEqual(4);
    });
});
