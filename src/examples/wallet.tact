struct Transfer {
    seqno: Int as uint32;
    mode: Int as uint8;
    to: Address;
    amount: Int as coins;
    body: Cell?;
}

message TransferMessage {
    signature: Slice;
    transfer: Transfer;
}

contract Wallet {
    
    seqno: Int as uint32 = 0;
    key: Int as uint256;
    walletId: Int as uint64;
    
    init(key: Int, walletId: Int) {
        self.key = key;
        self.walletId = walletId;
    }

    receive(msg: TransferMessage) {

        // Check Signature
        let op: Transfer = msg.transfer;
        // let op_hash: Int = hashCell(abi.pack_cell(op));
        // require(42, checkSignature(op_hash, msg.signature, self.key));
        require(43, op.seqno == self.seqno);

        // Increment seqno
        self.seqno = self.seqno + 1;

        // Send message
        send(SendParameters{value: op.amount, to: op.to, mode: op.mode, body: op.body});
    }

    get fun publicKey(): Int {
        return self.key;
    }

    get fun walletId(): Int {
        return self.walletId;
    }

    get fun seqno(): Int {
        return self.seqno;
    }
}