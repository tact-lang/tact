import "@stdlib/ownable";

struct JettonData {
    totalSupply: Int;
    mintable: Bool;
    owner: Address;
    content: Cell;
    walletCode: Cell;
}

message JettonUpdateContent {
    content: Cell?;
}

contract JettonDefaultContract {
    balance: Int;
    owner: Address;
    master: Address;

    init(master: Address, owner: Address) {
        self.balance = 0;
        self.owner = owner;
        self.master = master;
    }
}

trait Jetton with Ownable {
    totalSupply: Int;
    mintable: Bool;
    owner: Address;
    content: Cell?;
    walletCode: Cell;

    receive(msg: JettonUpdateContent) {

        // Allow changing content only by owner
        self.requireOwner();
        
        // Update content
        self.content = msg.content;
    }

    fun mint(to: Address, amount: Int, stateInit: StateInit) {

        // Update total supply
        self.totalSupply = self.totalSupply + amount;

        // TODO: Send message to wallet
    }

    virtual fun getJettonWalletInit(address: Address): StateInit {
        return initOf JettonDefaultContract(myAddress(), address);
    }

    // get fun get_jetton_data(): JettonData {
    //    return JettonData{ totalSupply: self.totalSupply, mintable: self.mintable, owner: self.owner, content: self.content, walletCode: self.walletCode };
    // }
}

trait JettonWallet with Ownable {
    master: Address;
    owner: Address;
}