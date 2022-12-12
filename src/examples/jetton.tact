import "@stdlib/jetton";

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
}