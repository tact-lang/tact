struct Transfer {
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
        let op_hash: Int = hashCell(abi.pack_cell(msg.transfer));
        require(10, checkSignature(op_hash, msg.signature, self.key));

        // Send message
        send(SendParameters{value: msg.transfer.amount, to: msg.transfer.amount, mode: msg.transfer.mode, body: msg.transfer.body});
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