struct Transfer {
    seqno: Int as uint32;
    mode: Int as uint8;
    to: Address;
    amount: Int as coins;
    body: Cell?;
}

message(123) TransferMessage {
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
        require(checkSignature(op_hash, msg.signature, self.key));
        require(msg.transfer.seqno == self.seqno);

        // Increment seqno
        self.seqno = self.seqno + 1;

        // Send message
        send(SendParameters{value: msg.transfer.amount, to: msg.transfer.to, mode: msg.transfer.mode, body: msg.transfer.body});
    }

    receive(msg: Slice) {
        if (!context().bounced) {
            self.seqno = self.seqno + 1;
        }
    }

    receive() {
        if (!context().bounced) {
            self.seqno = self.seqno + 1;
        }
    }

    receive("notify") {
        if (!context().bounced) {
            self.seqno = self.seqno + 1;
        }
    }

    receive("слава україни") {
        if (!context().bounced) {
            self.seqno = self.seqno + 1;
        }
    }

    receive("duplicate") {
        // Create new wallet
        let walletInit: StateInit = initOf Wallet(self.key, self.walletId + 1);
    }

    receiveBounced(msg: Slice) {
        // TODO: Handle
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