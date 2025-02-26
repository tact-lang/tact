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
    user1Key: Int as uint256;
    user2Key: Int as uint256;
    user3Key: Int as uint256;

    init(key1: Int, key2: Int, key3: Int) {
        self.user1Key = key1;
        self.user2Key = key2;
        self.user3Key = key3;
    }

    // deploy
    receive(_: Slice) {}

    receive(msg: Execute) {
        // Check all signatures
        let operationHash: Int = msg.operation.toCell().hash();
        let ok1: Bool = checkSignature(operationHash, msg.signature1, self.user1Key);
        let ok2: Bool = checkSignature(operationHash, msg.signature2, self.user2Key);
        let ok3: Bool = checkSignature(operationHash, msg.signature3, self.user3Key);
        
        require(msg.operation.seqno == self.seqno, "Invalid seqno");
        require(ok1 && ok2 && ok3, "Invalid signature");

        self.seqno += 1;
        commit();

        // Send messages
        self.execute(msg.operation);
    }

    fun execute(op: Operation) {
        send(SendParameters{ to: op.target, value: op.amount });
    }

    get fun key1(): Int {
        return self.user1Key;
    }

    get fun key2(): Int {
        return self.user2Key;
    }

    get fun key3(): Int {
        return self.user3Key;
    }

    get fun seqno(): Int {
        return self.seqno;
    }
}
