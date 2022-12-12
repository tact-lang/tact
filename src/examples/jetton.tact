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

    receive(msg: TokenReceived) {
        let ctx: Context = context();
        require(100, ctx.sender == self.master);
    }
}

contract SampleJetton with Jetton {

    totalSupply: Int as coins;
    owner: Address;
    content: Cell?;
    mintable: Bool;
    walletCode: Cell;

    init(totalSupply: Int, mintable: Bool, owner: Address, content: Cell?, walletCode: Cell) {
        self.totalSupply = totalSupply;
        self.owner = owner;
        self.mintable = mintable;
        self.content = content;
        self.walletCode = walletCode;
    }

    receive(msg: Mint) {
        let ctx: Context = context();
        self.mint(ctx.sender, msg.amount);
    }

    receive(msg: Burned) {
        
        // Check wallet
        self.requireWallet(msg.owner);

        // Update supply
        self.totalSupply = self.totalSupply - msg.amount;
    }

    overwrites fun getJettonWalletInit(address: Address): StateInit {
        return initOf SampleJettonWallet(myAddress(), address);
    }
}