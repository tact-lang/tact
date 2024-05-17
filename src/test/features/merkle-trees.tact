import "@stdlib/deploy";

struct AirdropEntry {
    address: Address;
    amount: Int as coins;
}

struct ProvableData {
    justForTestPurposes: Int;
    entries: map<Int, AirdropEntry>;
    anoterOne: Int as uint32;
}

message ProcessClaim {
    queryId: Int as uint64;
    proof: merkleProof<ProvableData>;
    index: Int as uint256;
}

contract MerkleTreesTestContract with Deployable {
    rootHash: Int;
    
    init(rootHash: Int) {
        self.rootHash = rootHash;
    }

    receive(msg: ProcessClaim) {
        require(msg.proof.rootHash == self.rootHash, "wrong merkle root");
        let entry: AirdropEntry = msg.proof.data.entries.get(msg.index)!!;
        
        send(SendParameters{
            to: entry.address,
            value: 0,
            mode: SendIgnoreErrors,
            body: entry.toCell()
        });
    }
}