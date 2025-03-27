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

struct FunCJettonWalletData {
    balance: Int as coins;
    owner: Address;
    minter: Address;
    code: Cell;
}

contract JettonResolverOverridenTester(
    minterAddress: Address,
    jettonWalletCode: Cell,
) with JettonResolver {
    override fun createJettonWalletInitData(owner: Address): Cell {
        return FunCJettonWalletData {
            balance: 0,
            owner: owner,
            minter: self.minterAddress,
            code: self.jettonWalletCode,
        }.toCell();
    }

    // deploy
    receive() {}

    get fun jettonWallet(owner: Address): Address {
        return self.calculateJettonWalletAddress(
            owner,
        );
    }
}

contract JettonReceiverTester(
    minterAddress: Address,
    jettonWalletCode: Cell,
    amountChecker: Int,
    payloadChecker: Slice,
) with JettonReceiver {
    override fun fetchIncomingJettons(msg: JettonNotification) {
        self.amountChecker = msg.amount;
        self.payloadChecker = msg.forwardPayload;
        cashback(msg.sender);
    }

    // deploy
    receive() {}

    get fun amount(): Int {
        return self.amountChecker;
    }

    get fun payload(): Slice {
        return self.payloadChecker;
    }

    get fun jettonWallet(owner: Address): Address {
        return self.calculateJettonWalletAddress(
            owner,
        );
    }
}

contract JettonSenderTester(
    minterAddress: Address,
    jettonWalletCode: Cell,
) with JettonSender {
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
}
