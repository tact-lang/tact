struct JettonMinterData {
    totalSupply: Int;
    mintable: Bool;
    owner: Address;
    content: Cell;
    jettonWalletCode: Cell;
}

struct JettonWalletData {
    balance: Int as coins;
    owner: Address;
    minter: Address;
    code: Cell;
}

message(4) JettonUpdateContent {
    queryId: Int as uint64;
    content: Cell;
}

message(0xf8a7ea5) JettonTransfer {
    queryId: Int as uint64;
    amount: Int as coins;
    destination: Address;
    responseDestination: Address?;
    customPayload: Cell?;
    forwardTonAmount: Int as coins;
    forwardPayload: Slice as remaining;
}

message(0x178d4519) JettonTransferInternal {
    queryId: Int as uint64;
    amount: Int as coins;
    sender: Address;
    responseDestination: Address?;
    forwardTonAmount: Int as coins;
    forwardPayload: Slice as remaining;
}

message(0x7362d09c) JettonNotification {
    queryId: Int as uint64;
    amount: Int as coins;
    sender: Address;
    forwardPayload: Slice as remaining;
}

message(0x595f07bc) JettonBurn {
    queryId: Int as uint64;
    amount: Int as coins;
    responseDestination: Address?;
    customPayload: Cell?;
}

message(0x7bdd97de) JettonBurnNotification {
    queryId: Int as uint64;
    amount: Int as coins;
    sender: Address;
    responseDestination: Address?;
}

message(0xd53276db) JettonExcesses {
    queryId: Int as uint64;
}

message(0x2c76b973) ProvideWalletAddress {
    queryId: Int as uint64;
    ownerAddress: Address;
    includeAddress: Bool;
}

message(0xd1735400) TakeWalletAddress {
    queryId: Int as uint64;
    walletAddress: Address;
    ownerAddress: Cell?;
}

message(21) Mint {
    queryId: Int as uint64;
    receiver: Address;
    tonAmount: Int as coins;
    mintMessage: JettonTransferInternal;
}

message(22) CloseMinting {}

message(3) ChangeOwner {
    queryId: Int as uint64;
    newOwner: Address;
}

message ProvideWalletBalance {
    receiver: Address;
    includeVerifyInfo: Bool;
}

struct VerifyInfo {
    owner: Address;
    minter: Address;
    code: Cell;
}

message TakeWalletBalance {
    balance: Int as coins;
    verifyInfo: VerifyInfo?;
}

message ClaimTON {
    receiver: Address;
}

struct TactJettonWalletInitData {
    balance: Int as coins;
    owner: Address;
    minter: Address;
}

trait JettonResolver {
    minterAddress: Address;
    jettonWalletCode: Cell;

    virtual fun createJettonWalletInitData(owner: Address): Cell {
        return TactJettonWalletInitData {
            balance: 0,
            owner,
            minter: self.minterAddress,
        }.toCell();
    }

    inline fun calculateJettonWalletAddress(owner: Address): Address {
        let initData = self.createJettonWalletInitData(owner);
        return contractAddress(StateInit { code: self.jettonWalletCode, data: initData });
    }

    inline fun calculateJettonBasechainWalletAddress(owner: Address): BasechainAddress {
        let initData = self.createJettonWalletInitData(owner);
        return contractBasechainAddress(StateInit { code: self.jettonWalletCode, data: initData });
    }
}

trait JettonReceiver with JettonResolver {
    minterAddress: Address;
    jettonWalletCode: Cell;

    receive(msg: JettonNotification) {
        let thisContractJettonWallet = self.calculateJettonBasechainWalletAddress(
            myAddress(),
        );
        let sender = parseStdAddress(sender().asSlice());

        require(sender.workchain == 0 && sender.address == thisContractJettonWallet.hash!!, "Incorrect sender");

        self.fetchIncomingJettons(msg);
    }

    abstract fun fetchIncomingJettons(msg: JettonNotification);
}

trait JettonSender with JettonResolver {
    minterAddress: Address;
    jettonWalletCode: Cell;

    fun sendJettons(receiver: Address, amount: Int) {
        let thisContractJettonWallet = self.calculateJettonWalletAddress(
            myAddress(),
        );

        message(MessageParameters {
            to: thisContractJettonWallet,
            value: 0,
            body: JettonTransfer {
                queryId: 0,
                amount,
                destination: receiver,
                responseDestination: myAddress(),
                customPayload: null,
                forwardTonAmount: 0,
                // to bypass the check in the wallet
                forwardPayload: beginCell().storeBool(true).asSlice(),
            }.toCell(),
            mode: SendRemainingValue,
        });
    }

    fun sendJettonsExtended(receiver: Address, amount: Int, forwardTonAmount: Int, forwardPayload: Slice, customPayload: Cell?) {
        let thisContractJettonWallet = self.calculateJettonWalletAddress(
            myAddress(),
        );

        message(MessageParameters {
            to: thisContractJettonWallet,
            value: 0,
            body: JettonTransfer {
                queryId: 0,
                amount,
                destination: receiver,
                responseDestination: myAddress(),
                customPayload,
                forwardTonAmount,
                forwardPayload,
            }.toCell(),
            mode: SendRemainingValue,
        });
    }
}
