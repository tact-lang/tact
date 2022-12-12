import "@stdlib/jetton";

message Mint {
    amount: Int;
}

contract SampleJettonWallet with JettonWallet {
    master: Address;
    owner: Address;
    balance: Int;

    init(master: Address, owner: Address) {
        self.balance = 0;
        self.master = master;
        self.owner = owner;
    }
}

contract SampleJetton with Jetton {

    totalSupply: Int as coins;
    owner: Address;
    content: Cell?;
    mintable: Bool;

    init(owner: Address, content: Cell?) {
        self.totalSupply = 0;
        self.owner = owner;
        self.mintable = true;
        self.content = content;
    }

    receive(msg: Mint) {
        let ctx: Context = context();
        self.mint(ctx.sender, msg.amount);
    }

    overwrites fun getJettonWalletInit(address: Address): StateInit {
        return initOf SampleJettonWallet(myAddress(), address);
    }
}