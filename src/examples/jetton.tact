import "@stdlib/jetton";

message Mint {
    amount: Int;
}

message(0x7bdd97de) Burned {
    amount: Int;
    owner: Address;
    cashback: Address?;
}

message TokenReceived {
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
        self.mint(ctx.sender, msg.amount, initOf SampleJettonWallet(myAddress(), ctx.sender));
    }

    receive(msg: Burned) {
        let ctx: Context = context();
        // let addr: Address = contractAddress(0, self.getJettonWalletInit(msg.owner));
    }

    overwrites fun getJettonWalletInit(address: Address): StateInit {
        return initOf SampleJettonWallet(myAddress(), address);
    }
}