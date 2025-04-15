import { beginCell, toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Tester } from "./output/crypto_Tester";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";
import { keccak_256 as keccak256 } from "@noble/hashes/sha3";

function bigIntOfHash(hash: Uint8Array) {
    return BigInt(
        "0x" +
            Array.from(hash)
                .map((b) => b.toString(16).padStart(2, "0"))
                .join(""),
    );
}

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
        const str1 = "hello world";
        const s1 = beginCell().storeStringTail(str1).asSlice();
        let hashWithRefs = await contract.getKeccak256(s1);
        let hashIgnoringRefs = await contract.getKeccak256IgnoreRefs(s1);
        expect(hashWithRefs.toString()).toEqual(hashIgnoringRefs.toString());

        // On-chain implementation should correspond to the off-chain one
        const keccak1 = bigIntOfHash(keccak256(str1));
        expect(hashWithRefs.toString()).toEqual(keccak1.toString());

        // Hashes of long slices should NOT match
        const str2 =
            "------------------------------------------------------------------------------------------------------------------------------129";
        const s2 = beginCell().storeStringTail(str2).asSlice();
        hashWithRefs = await contract.getKeccak256(s2);
        hashIgnoringRefs = await contract.getKeccak256IgnoreRefs(s2);
        expect(hashWithRefs.toString()).not.toEqual(
            hashIgnoringRefs.toString(),
        );

        // On-chain implementation should correspond to the off-chain one
        const keccak2 = bigIntOfHash(keccak256(str2));
        expect(hashWithRefs.toString()).toEqual(keccak2.toString());
    });
});
