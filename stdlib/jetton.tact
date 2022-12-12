import "@stdlib/ownable";

struct JettonData {
    totalSupply: Int;
    mintable: Bool;
    owner: Address;
    content: Cell;
    walletCode: Cell;
}

message(0x7bdd97de) Burned {
    amount: Int;
    owner: Address;
    cashback: Address?;
}

message TokenReceived {
    amount: Int;
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

    fun mint(to: Address, amount: Int) {

        // Update total supply
        self.totalSupply = self.totalSupply + amount;

        // Create message
        let winit: StateInit = self.getJettonWalletInit(to);
        let walletAddress: Address = contractAddress(0, winit.code, winit.data);
        send(SendParameters{
            to: walletAddress, 
            value: 0, 
            bounce: false,
            body: abi.pack_cell(TokenReceived{ amount: amount }),
            code: winit.code,
            data: winit.data
        });
    }

    fun requireWallet(owner: Address) {
        let ctx: Context = context();
        let winit: StateInit = self.getJettonWalletInit(owner);
        require(100, contractAddress(0, winit.code, winit.data) == ctx.sender);
    }

    virtual fun getJettonWalletInit(address: Address): StateInit {
        return initOf JettonDefaultContract(myAddress(), address);
    }

    get fun get_jetton_data(): JettonData {
        return JettonData{ totalSupply: self.totalSupply, mintable: self.mintable, owner: self.owner, content: self.content, walletCode: self.walletCode };
    }
}

trait JettonWallet with Ownable {
    master: Address;
    owner: Address;
}