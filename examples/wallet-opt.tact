message TransferMessage {
    signature: Slice as bytes64;
    transfer: Slice as remaining;
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
        let op_hash: Int = msg.transfer.hash();
        require(checkSignature(op_hash, msg.signature, self.key), "Invalid signature");

        // Check parameters
        let pkg: Slice = msg.transfer;
        let seqno: Int = pkg.loadInt(32);
        let mode: Int = pkg.loadInt(8);
        let body: Cell = pkg.loadRef();
        require(seqno == self.seqno, "Invalid seqno");

        // Increment seqno
        self.seqno = (self.seqno + 1) % 65536;

        // Send message
        nativeSendMessage(body, mode);
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