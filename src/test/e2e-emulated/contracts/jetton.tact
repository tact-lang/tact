import "@stdlib/jetton";

message SendJettonsFast {
    amount: Int as coins;
    destination: Address;
}

message SendJettonsExtended {
    amount: Int as coins;
    destination: Address;
    forwardTonAmount: Int as coins;
    forwardPayload: Slice as remaining;
}

contract JettonTester(
    minterAddress: Address,
    jettonWalletCode: Cell,
    amountChecker: Int,
    payloadChecker: Slice,
) with JettonSender, JettonReceiver {
    override fun fetchIncomingJettons(msg: JettonNotification) {
        self.amountChecker = msg.amount;
        self.payloadChecker = msg.forwardPayload;
        cashback(msg.sender);
    }

    receive(msg: SendJettonsFast) {
        self.sendJettons(msg.destination, msg.amount);
    }

    receive(msg: SendJettonsExtended) {
        self.sendJettonsExtended(
            msg.destination,
            msg.amount,
            msg.forwardTonAmount,
            msg.forwardPayload,
            null,
        );
    }

    // deploy
    receive() {}

    get fun amount(): Int {
        return self.amountChecker;
    }

    get fun payload(): Slice {
        return self.payloadChecker;
    }

    get fun jettonWallet(): Address {
        return calculateJettonWalletAddress(
            myAddress(),
            self.minterAddress,
            self.jettonWalletCode,
        );
    }
}
