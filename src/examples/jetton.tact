import "@stdlib/jetton";

contract SampleJettonWallet with JettonWallet {
    master: Address;
    owner: Address;

    init(master: Address, owner: Address) {
        self.master = master;
        self.owner = owner;
    }
}

message Mint {
    amount: Int;
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
        self.mint(ctx.sender, msg.amount, initOf SampleJettonWallet(self.owner, ctx.sender));
    }
}