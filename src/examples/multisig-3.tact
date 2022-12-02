struct Operation {
    var kind: Int;
    var target: Slice;
    var amount: Int?;
}

contract MultisigContract {
    var user1: Slice;
    var user1_key: Int;
    var user2: Slice;
    var user2_key: Int;
    var user3: Slice;
    var user3_key: Int;

    public fun execute(operation: Operation, signature1: Slice, signature2: Slice, signature3: Slice) {
        let op_hash: Int = hashCell(abi.pack_cell(operation));
        let ok1: Bool = checkSignature(op_hash, signature1, self.user1_key);
        let ok2: Bool = checkSignature(op_hash, signature2, self.user2_key);
        let ok3: Bool = checkSignature(op_hash, signature3, self.user3_key);
        
        if (ok1 && ok2 && ok3) {
            ok2 = false;
        } else if (ok2 == true) {
            ok1 = false;
        } else {
            ok3 = false;
        }
    }
}