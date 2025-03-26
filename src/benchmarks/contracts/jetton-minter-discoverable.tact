// https://github.com/ton-blockchain/TEPs/blob/master/text/0089-jetton-wallet-discovery.md

import "./jetton-wallet";
import "./messages";

const ProvideAddressGasConsumption: Int = ton("0.01");
const Workchain: Int = 0;

struct JettonMasterState {
    totalSupply: Int as coins;
    mintable: Bool;
    adminAddress: Address;
    jettonContent: Cell;
    jettonWalletCode: Cell;
}

contract JettonMinter(
    totalSupply: Int as coins,
    owner: Address,
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
        // we use message fwdFee for estimation of forward_payload costs
        let ctx = context();
        let fwdFee = ctx.readForwardFee();
        throwUnless(75, ctx.value > fwdFee + ProvideAddressGasConsumption);

        let ownerWorkchain: Int = parseStdAddress(msg.ownerAddress.asSlice()).workchain;

        let targetJettonWallet: BasechainAddress =
            (ownerWorkchain == Workchain) ?
            contractBasechainAddress(initOf JettonWallet(0, msg.ownerAddress, myAddress()))
            : emptyBasechainAddress();

        message(MessageParameters {
            body: makeTakeWalletAddressMsg(targetJettonWallet, msg),
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
        });
    }

    receive(msg: JettonUpdateContent) {
        throwUnless(73, sender() == self.owner);
        self.jettonContent = msg.content;
    }

    receive(msg: Mint) {
        throwUnless(73, sender() == self.owner);
        self.totalSupply += msg.mintMessage.amount;

        deploy(DeployParameters{
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: msg.mintMessage.toCell(),
            init: getJettonWalletInit(msg.receiver)
        });
    }

    receive(msg: ChangeOwner) {
        throwUnless(73, sender() == self.owner);
        self.owner = msg.newOwner;
    }

    receive(_: Slice) { throw(0xffff) }

    get fun get_jetton_data(): JettonMasterState {
        return JettonMasterState {
            totalSupply: self.totalSupply,
            mintable: true,
            adminAddress: self.owner,
            jettonContent: self.jettonContent,
            jettonWalletCode: codeOf JettonWallet,
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
    return initOf JettonWallet(0, address, myAddress());
}

inline fun getJettonWalletByOwner(jettonWalletOwner: Address): Address {
    return contractAddress(getJettonWalletInit(jettonWalletOwner));
}

inline fun getJettonBasechainWalletByOwner(jettonWalletOwner: Address): BasechainAddress {
    return contractBasechainAddress(getJettonWalletInit(jettonWalletOwner));
}

inline extends fun isNotNone(self: Address): Bool { return self.asSlice().preloadUint(2) != 0 }
