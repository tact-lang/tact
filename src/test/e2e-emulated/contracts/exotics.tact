import "@stdlib/deploy";

struct AirdropEntry {
    address: Address;
    amount: Int as coins;
}

struct ProvableData {
    justForTestPurposes: Int;
    entries: map<Int as uint16, AirdropEntry>;
    anoterOne: Int as uint32;
}

message ProcessClaim {
    queryId: Int as uint64;
    proof: merkleProof<ProvableData>;
    index: Int as uint256;
}

message TestResponse {
    queryId: Int as uint64;
    rootHash: Int as uint256;
    depth: Int as uint16;
    data: ProvableData;
    entry: AirdropEntry;
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
            body: TestResponse {
                queryId: msg.queryId,
                rootHash: msg.proof.rootHash,
                depth: msg.proof.depth,
                data: msg.proof.data,
                entry: entry
            }.toCell()
        });
    }
}