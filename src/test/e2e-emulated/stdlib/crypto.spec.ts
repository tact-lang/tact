import { beginCell, toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Tester } from "./output/crypto_Tester";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;
    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await Tester.fromInit());

    const deployResult = await contract.send(
        treasury.getSender(),
        { value: toNano("1") },
        null,
    );
    expect(deployResult.transactions).toHaveTransaction({
        from: treasury.address,
        to: contract.address,
        success: true,
        deploy: true,
    });

    return {
        blockchain,
        treasury,
        contract,
    };
};

describe("crypto.tact: keccak256() function", () => {
    const state = cached(setup);

    it("should hash values correctly", async () => {
        const { contract, treasury } = await state.get();
        const result = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            "keccak256",
        );
        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
        });

        // Hashes of short slices should match
        const s1 = beginCell().storeStringTail("hello world").asSlice();
        let hash1 = await contract.getKeccak256(s1);
        let hash2 = await contract.getKeccak256IgnoreRefs(s1);
        expect(hash1.toString()).toEqual(hash2.toString());

        // Hashes of long slices should NOT match
        const s2 = beginCell()
            .storeStringTail(
                "------------------------------------------------------------------------------------------------------------------------------129",
            )
            .asSlice();
        hash1 = await contract.getKeccak256(s2);
        hash2 = await contract.getKeccak256IgnoreRefs(s2);
        expect(hash1.toString()).not.toEqual(hash2.toString());
    });
});
