struct Operation {
    var seqno: Int;
    var kind: Int;
    var target: Slice;
    var amount: Int?;
}

contract MultisigContract {
    var seqno: Int;
    var user1_key: Int;
    var user2_key: Int;
    var user3_key: Int;

    public fun execute(operation: Operation, signature1: Slice, signature2: Slice, signature3: Slice) {
        let op_hash: Int = hashCell(abi.pack_cell(operation));
        let ok1: Bool = checkSignature(op_hash, signature1, self.user1_key);
        let ok2: Bool = checkSignature(op_hash, signature2, self.user2_key);
        let ok3: Bool = checkSignature(op_hash, signature3, self.user3_key);
        require(10, operation.seqno == self.seqno);
        require(10, ok1 && ok2 && ok3);

        let b: Builder = beginCell();
        b = storeUint(b, 0x10, 6);
        b = storeSlice(b, operation.target);
        b = storeCoins(b, operation.amount!!);
        b = storeUint(b, 1, 1 + 4 + 4 + 64 + 32 + 1 + 1);
        nativeSendMessage(endCell(b), 0);
    }
}