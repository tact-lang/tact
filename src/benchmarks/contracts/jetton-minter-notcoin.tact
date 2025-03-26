import "./messages";
import "./jetton-wallet-notcoin";

const Workchain: Int = 0;

struct JettonMasterState {
    totalSupply: Int as coins;
    mintable: Bool;
    adminAddress: Address;
    jettonContent: Cell;
    jettonWalletCode: Cell;
}

contract JettonMinterNotcoin(
    totalSupply: Int as coins,
    owner: Address,
    nextOwner: Address,
    jettonContent: Cell,
) {
    receive(msg: JettonBurnNotification) {
        let sender = parseStdAddress(sender().asSlice());
        let wallet = getJettonBasechainWalletByOwner(msg.sender);

        throwUnless(74, sender.workchain == Workchain && sender.address == wallet.hash!!);

        self.totalSupply -= msg.amount;

        if (msg.responseDestination.isNotNone()) {
            message(MessageParameters {
                to: msg.responseDestination,
                body: JettonExcesses{ queryId: msg.queryId }.toCell(),
                value: 0,
                bounce: false,
                mode: SendRemainingValue | SendIgnoreErrors, // ignore errors, because supply has already been updated
            });
        }
    }

    receive(msg: ProvideWalletAddress) {
        let ownerWorkchain: Int = parseStdAddress(msg.ownerAddress.asSlice()).workchain;

        let targetJettonWallet: BasechainAddress =
            (ownerWorkchain == Workchain) ?
            contractBasechainAddress(initOf JettonWalletNotcoin(0, msg.ownerAddress, myAddress()))
            : emptyBasechainAddress();

        message(MessageParameters {
            body: makeTakeWalletAddressMsg(targetJettonWallet, msg),
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendBounceIfActionFail,
        });
    }

    receive(msg: Mint) {
        let ctx = context();
        throwUnless(73, ctx.sender == self.owner);
        self.totalSupply += msg.mintMessage.amount;
        
        forceBasechain(msg.receiver);
        checkAmountIsEnoughToTransfer(ctx.value, msg.mintMessage.forwardTonAmount, ctx.readForwardFee());

        deploy(DeployParameters{
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: msg.mintMessage.toCell(),
            init: getJettonWalletInit(msg.receiver)
        });
    }

    receive(msg: JettonUpdateContent) {
        throwUnless(73, sender() == self.owner);
        self.jettonContent = msg.content;
    }

    receive(msg: ChangeAdmin) {
        throwUnless(73, sender() == self.owner);
        self.nextOwner = msg.nextAdmin;
    }

    receive(msg: ClaimAdmin) {
        throwUnless(73, sender() == self.nextOwner);
        self.owner = self.nextOwner;
        self.nextOwner = emptyAddress();
    }

    receive(msg: DropAdmin) {
        throwUnless(73, sender() == self.owner);
        self.owner = emptyAddress();
        self.nextOwner = emptyAddress();
    }

    // accept tons
    receive(msg: TopUp) {}

    receive(_: Slice) { throw(0xffff) }

    get fun get_jetton_data(): JettonMasterState {
        return JettonMasterState {
            totalSupply: self.totalSupply,
            mintable: true,
            adminAddress: self.owner,
            jettonContent: self.jettonContent,
            jettonWalletCode: codeOf JettonWalletNotcoin,
        }
    }

    get fun get_wallet_address(ownerAddress: Address): Address {
        return getJettonWalletByOwner(ownerAddress);
    }
}

asm fun emptyAddress(): Address { b{00} PUSHSLICE }

inline fun makeTakeWalletAddressMsg(targetJettonWallet: BasechainAddress, msg: ProvideWalletAddress): Cell {
    return
        beginCell()
        .storeUint(TakeWalletAddressOpcode, 32)
        .storeUint(msg.queryId, 64)
        .storeBasechainAddress(targetJettonWallet)
        .storeMaybeRef(msg.includeAddress ? beginCell().storeAddress(msg.ownerAddress).endCell() : null)
        .endCell();
}

inline fun getJettonWalletInit(address: Address): StateInit {
    return initOf JettonWalletNotcoin(0, address, myAddress());
}

inline fun getJettonWalletByOwner(jettonWalletOwner: Address): Address {
    return contractAddress(getJettonWalletInit(jettonWalletOwner));
}

inline fun getJettonBasechainWalletByOwner(jettonWalletOwner: Address): BasechainAddress {
    return contractBasechainAddress(getJettonWalletInit(jettonWalletOwner));
}

inline extends fun isNotNone(self: Address): Bool { return self.asSlice().preloadUint(2) != 0 }
