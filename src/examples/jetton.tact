import "@stdlib/ownable";

contract JettonMinter with OwnableTransferable {
    owner: Address;
    
    totalSupply: Int as coins;
    content: Cell;
    jettonWalletCode: Cell;

    init(supply: Int, owner: Address, content: Cell, jettonWalletCode: Cell) {
        self.totalSupply = supply;
        self.owner = owner;
        self.content = content;
        self.jettonWalletCode = jettonWalletCode;
    }
}