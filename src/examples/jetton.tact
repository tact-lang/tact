import "@stdlib/jetton";

message Mint {
    amount: Int;
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
        self.mint(ctx.sender, msg.amount, ctx.sender);
    }

    receive("Mint!") {
        let ctx: Context = context();
        self.mint(ctx.sender, 1000000000, ctx.sender);
    }
}