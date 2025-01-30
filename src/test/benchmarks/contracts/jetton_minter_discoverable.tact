import "@stdlib/ownable";
import "@stdlib/deploy";
import "./jetton_wallet";
import "./messages";

asm fun emptyAddress(): Address { b{00} PUSHSLICE }

struct JettonMasterState {
    totalSupply: Int as coins;
    mintable: Bool;
    adminAddress: Address;
    jettonContent: Cell;
    jettonWalletCode: Cell;
}

contract JettonMinter with OwnableTransferable {
    totalSupply: Int as coins;
    mintable: Bool;
    owner: Address;
    jettonContent: Cell;

    init(owner: Address, jettonContent: Cell) {
        self.totalSupply = 0;
        self.mintable = true;
        self.owner = owner;
        self.jettonContent = jettonContent;
    }

    receive(msg: TokenBurnNotification) {
        //Check that the message is from msg.sender's jetton_wallet
        require(sender() == self.getJettonWalletByOwner(msg.sender), "Not wallet owner");

        self.totalSupply -= msg.amount;
        send(SendParameters{
            to: msg.response_destination,
            value: 0,
            bounce: false,
            mode: SendRemainingValue | SendIgnoreErrors, //ignore errors, because supply already been updated
            body: TokenExcesses{
                query_id: msg.query_id
            }.toCell()
        });
    }

    receive(msg: TokenUpdateContent){
        self.requireOwner(); // Allow changing content only by owner
        self.jettonContent = msg.content; // Update content
    }

    // https://github.com/ton-blockchain/TEPs/blob/master/text/0089-jetton-wallet-discovery.md
    receive(msg: ProvideWalletAddress) {
        //require(context().value >= ton("0.006625199"), "Insufficient gas");
        let includedAddress: Address? = null;
        let workchain: Int = parseStdAddress(msg.owner_address.asSlice()).workchain;
        //Note, that emptyAddress != null, it is different values.
        //We do like that according to TEP above
        let targetJettonWallet: Address = emptyAddress();

        //Here was no such check in Howard's code
        if(workchain == 0) {
            //Only in this case (address is from basechain) we can calculate the address
            targetJettonWallet = contractAddress(initOf JettonWallet(msg.owner_address, myAddress()));
        }
        if (msg.include_address) {
            includedAddress = msg.owner_address;
        }
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: self.takeWalletBody(targetJettonWallet, includedAddress, msg.query_id)
        });
    }
    receive(msg: Mint) {
        self.requireOwner(); // Allow minting only by owner
        require(self.mintable, "Not mintable");
        //Maybe we should check that msg.value is enough to cover the gas fees
        //Or, maybe we should do self.totalSupply -= msg.amount if bounced.
        //But there is no any check in Howard's code and in official funC code,
        self.totalSupply += msg.amount; // Update total supply

        let winit: StateInit = self.getJettonWalletInit(msg.receiver);

        send(SendParameters{
            to: contractAddress(winit),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: TokenTransferInternal{
                query_id: 0,
                amount: msg.amount,
                from: myAddress(),
                response_destination: self.owner, // Owner is minting, so send excess to owner
                forward_ton_amount: 1, // 1 nanoton is enough to send a notification
                forward_payload: emptySlice()
            }.toCell(),
        code: winit.code,
        data: winit.data
        });
    }

    bounced(msg: bounced<TokenTransferInternal>){
        self.totalSupply -= msg.amount;
    }
    inline fun takeWalletBody(targetJettonWallet: Address, includedAddress: Address?, query_id: Int): Cell {
        let body: Builder = beginCell()
        .storeUint(0xd1735400, 32)
        .storeUint(query_id, 64)
        .storeSlice(targetJettonWallet.asSlice());
        if (includedAddress != null) {
            let includedAddressCell: Cell = beginCell().storeSlice(includedAddress!!.asSlice()).endCell();
            body = body.storeBit(true); // Maybe bit
            body = body.storeRef(includedAddressCell);
        } else {
            body = body.storeBit(false); // Maybe bit
        }
        return body.endCell();
    }

    inline fun getJettonWalletByOwner(jetton_wallet_owner: Address): Address {
        let jwInit: StateInit = self.getJettonWalletInit(jetton_wallet_owner);
        return contractAddress(jwInit);
    }

    inline fun getJettonWalletInit(address: Address): StateInit {
        return initOf JettonWallet(address, myAddress());
    }

    get fun get_jetton_data(): JettonMasterState {
        return JettonMasterState {
            totalSupply: self.totalSupply,
            mintable: self.mintable,
            adminAddress: self.owner,
            jettonContent: self.jettonContent,
                                                //Owner may be any address, what matters here is the code, not data.
            jettonWalletCode: initOf JettonWallet(myAddress(), myAddress()).code
        }
    }
    get fun get_wallet_address(ownerAddress: Address): Address {
        return self.getJettonWalletByOwner(ownerAddress);
    }
}