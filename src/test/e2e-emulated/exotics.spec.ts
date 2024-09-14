import { beginCell, Builder, Dictionary, Slice, toNano } from "@ton/core";
import {
    Blockchain,
    printTransactionFees,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import {
    AirdropEntry,
    MerkleTreesTestContract,
} from "./contracts/output/exotics_MerkleTreesTestContract";
import "@ton/test-utils";
import { randomAddress } from "@ton/test-utils";

const airdropEntryValue = {
    serialize: (src: AirdropEntry, builder: Builder) => {
        builder.storeAddress(src.address).storeCoins(src.amount);
    },
    parse: (src: Slice) => {
        return {
            $$type: "AirdropEntry" as const,
            address: src.loadAddress(),
            amount: src.loadCoins(),
        };
    },
};

describe("exotics", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<MerkleTreesTestContract>;
    let dict: Dictionary<number, AirdropEntry>;

    beforeAll(() => {
        dict = Dictionary.empty(Dictionary.Keys.Uint(16), airdropEntryValue);
        dict.set(0, {
            $$type: "AirdropEntry",
            address: randomAddress(),
            amount: toNano("10"),
        });
        dict.set(1, {
            $$type: "AirdropEntry",
            address: randomAddress(),
            amount: toNano("20"),
        });
        dict.set(2, {
            $$type: "AirdropEntry",
            address: randomAddress(),
            amount: toNano("30"),
        });
    });

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        const dictCell = beginCell().storeDictDirect(dict).endCell();

        contract = blockchain.openContract(
            await MerkleTreesTestContract.fromInit(
                BigInt("0x" + dictCell.hash().toString("hex")),
            ),
        );
    });

    it("should check merkle proofs", async () => {
        const proof = dict.generateMerkleProof([0]);
        const result = await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            {
                $$type: "ProcessClaim",
                index: 0n,
                queryId: 123n,
                proof,
            },
        );
        printTransactionFees(result.transactions);
        console.log(result.transactions[1].vmLogs);
    });
});
