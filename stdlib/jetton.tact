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
        
    }

    // get fun get_jetton_data(): JettonData {
    //    return JettonData{ totalSupply: self.totalSupply, mintable: self.mintable, owner: self.owner, content: self.content, walletCode: self.walletCode };
    // }
}

trait JettonWallet with Ownable {
    master: Address;
    owner: Address;
}