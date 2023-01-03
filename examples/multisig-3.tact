struct Operation {
    seqno: Int as uint32;
    amount: Int as coins;
    target: Address;
}

message Execute {
    operation: Operation;
    signature1: Slice; 
    signature2: Slice; 
    signature3: Slice;
}

message Executed {
    seqno: Int as uint32;
}

contract MultisigContract {
    seqno: Int as uint32 = 0;
    user1_key: Int as uint256;
    user2_key: Int as uint256;
    user3_key: Int as uint256;

    init(key1: Int, key2: Int, key3: Int) {
        self.user1_key = key1;
        self.user2_key = key2;
        self.user3_key = key3;
    }

    receive("Deploy") {
        // Do nothing
    }

    receive(msg: Execute) {

        // Check all signatures
        let op_hash: Int = msg.operation.toCell().hash();
        let ok1: Bool = checkSignature(op_hash, msg.signature1, self.user1_key);
        let ok2: Bool = checkSignature(op_hash, msg.signature2, self.user2_key);
        let ok3: Bool = checkSignature(op_hash, msg.signature3, self.user3_key);
        require(msg.operation.seqno == self.seqno, "Invalid seqno");
        require(ok1 && ok2 && ok3, "Invalid signature");

        // Send messages
        self.execute(msg.operation);
    }

    fun execute(op: Operation) {
        send(SendParameters{ to: op.target, value: op.amount });
    }

    get fun key1(): Int {
        return self.user1_key;
    }

    get fun key2(): Int {
        return self.user2_key;
    }

    get fun key3(): Int {
        return self.user3_key;
    }

    get fun seqno(): Int {
        return self.seqno;
    }
}