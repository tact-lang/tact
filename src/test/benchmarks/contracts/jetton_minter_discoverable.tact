// https://github.com/ton-blockchain/TEPs/blob/master/text/0089-jetton-wallet-discovery.md

import "./jetton_wallet";
import "./messages";

const ProvideAddressGasConsumption: Int = 10000000;
const Workchain: Int = 0;

struct JettonMasterState {
    totalSupply: Int as coins;
    mintable: Bool;
    adminAddress: Address;
    jettonContent: Cell;
    jettonWalletCode: Cell;
}

contract JettonMinter {
    totalSupply: Int as coins;
    owner: Address;
    jettonContent: Cell;

    init(owner: Address, jettonContent: Cell) {
        self.totalSupply = 0;
        self.owner = owner;
        self.jettonContent = jettonContent;
    }

    receive(msg: ProvideWalletAddress) {
        // we use message fwdFee for estimation of forward_payload costs
        let ctx = context();
        let fwdFee = muldivc(fwdFee(ctx.raw), 3, 2);
        throwUnless(75, ctx.value > fwdFee + ProvideAddressGasConsumption);

        let includedAddress: Address? = msg.includeAddress ? msg.ownerAddress : null;

        let workchain: Int = parseStdAddress(msg.ownerAddress.asSlice()).workchain;

        let targetJettonWallet: Address =
            (workchain == Workchain) ?
            contractAddress(initOf JettonWallet(msg.ownerAddress, myAddress()))
            : emptyAddress();

        let outMsg = takeWalletBody(targetJettonWallet, includedAddress, msg.queryId);

        send(SendParameters {
            body: outMsg,
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
        });
    }

    receive(msg: JettonBurnNotification) {
        // Check that the message is from msg.sender's jetton_wallet
       throwUnless(74, sender() == getJettonWalletByOwner(msg.sender));

        self.totalSupply -= msg.amount;

        if (msg.responseDestination.isNotNone()) {
            send(SendParameters {
                to: msg.responseDestination,
                body: JettonExcesses{ queryId: msg.queryId }.toCell(),
                value: 0,
                bounce: false,
                mode: SendRemainingValue | SendIgnoreErrors, // ignore errors, because supply has already been updated
            });
        }
    }

    receive(msg: JettonUpdateContent) {
        throwUnless(73, sender() == self.owner);
        self.jettonContent = msg.content;
    }

    receive(msg: Mint) {
        throwUnless(73, sender() == self.owner);
        self.totalSupply += msg.amount; // Update total supply

        deploy(DeployParameters{
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: JettonTransferInternal{
                queryId: 0,
                amount: msg.amount,
                sender: myAddress(),
                responseDestination: self.owner, // Owner is minting, so send excess to owner
                forwardTonAmount: 1, // 1 nanoton is enough to send a notification
                forwardPayload: emptySlice()
            }.toCell(),
            init: getJettonWalletInit(msg.receiver)
        });
    }

    receive(msg: ChangeOwner) {
        throwUnless(73, sender() == self.owner);
        self.owner = msg.newOwner;
    }

    get fun get_jetton_data(): JettonMasterState {
        return JettonMasterState {
            totalSupply: self.totalSupply,
            mintable: true,
            adminAddress: self.owner,
            jettonContent: self.jettonContent,
            // Owner may be any address, what matters here is the code, not data.
            jettonWalletCode: initOf JettonWallet(myAddress(), myAddress()).code
        }
    }
    get fun get_wallet_address(ownerAddress: Address): Address {
        return getJettonWalletByOwner(ownerAddress);
    }
}

asm fun emptyAddress(): Address { b{00} PUSHSLICE }

inline fun takeWalletBody(targetJettonWallet: Address, includedAddress: Address?, query_id: Int): Cell {
    let body: Builder = beginCell()
        .storeUint(0xd1735400, 32)
        .storeUint(query_id, 64)
        .storeAddress(targetJettonWallet);
    if (includedAddress != null) {
        body = body.storeBit(true); // Maybe bit
        body = body.storeRef(beginCell().storeAddress(includedAddress!!).endCell());
    } else {
        body = body.storeBit(false); // Maybe bit
    }
    return body.endCell();
}

inline fun getJettonWalletInit(address: Address): StateInit {
    return initOf JettonWallet(address, myAddress());
}

inline fun getJettonWalletByOwner(jettonWalletOwner: Address): Address {
    return contractAddress(getJettonWalletInit(jettonWalletOwner));
}

inline fun fwdFee(ctxRaw: Slice): Int {
    ctxRaw.loadAddress();
    ctxRaw.loadCoins();
    ctxRaw.skipBits(1);
    ctxRaw.loadCoins();
    return ctxRaw.loadCoins();
}

inline extends fun isNotNone(self: Address): Bool { return self.asSlice().preloadUint(2) != 0 }
