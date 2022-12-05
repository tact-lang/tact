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

contract MultisigContract {
    seqno: Int as uint32;
    user1_key: Int as uint256;
    user2_key: Int as uint256;
    user3_key: Int as uint256;

    init(key1: Int, key2: Int, key3: Int) {
        self.seqno = 0;
        self.user1_key = key1;
        self.user2_key = key2;
        self.user3_key = key3;
    }

    receive(msg: Execute) {

        // Check all signatures
        let op_hash: Int = hashCell(abi.pack_cell(msg.operation));
        let ok1: Bool = checkSignature(op_hash, msg.signature1, self.user1_key);
        let ok2: Bool = checkSignature(op_hash, msg.signature2, self.user2_key);
        let ok3: Bool = checkSignature(op_hash, msg.signature3, self.user3_key);
        require(10, msg.operation.seqno == self.seqno);
        require(10, ok1 && ok2 && ok3);

        // Send messages
        self.execute(msg.operation);
    }

    fun execute(op: Operation) {
        let b: Builder = beginCell();
        b = storeUint(b, 0x10, 6);
        b = storeSlice(b, op.target);
        b = storeCoins(b, op.amount);
        b = storeUint(b, 1, 1 + 4 + 4 + 64 + 32 + 1 + 1);
        nativeSendMessage(endCell(b), 0);
    }

    get fun testAddress(): Address {
        return computeAddress(0, endCell(beginCell()), endCell(beginCell()));
    }

    get fun seqno(): Int {
        return self.seqno;
    }
}