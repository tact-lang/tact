contract JettonMinter {
    totalSupply: Int as coins;
    owner: Address;
    content: Cell;
    jettonWalletCode: Cell;

    init(supply: Int, owner: Address, content: Cell, jettonWalletCode: Cell) {
        self.totalSupply = supply;
        self.owner = owner;
        self.content = content;
        self.jettonWalletCode = jettonWalletCode;
    }
}