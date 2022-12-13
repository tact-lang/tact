import "@stdlib/ownable";
import "./jetton/messages";

struct JettonData {
    totalSupply: Int;
    mintable: Bool;
    owner: Address;
    content: Cell;
    walletCode: Cell;
}

//
// transfer query_id:uint64 amount:(VarUInteger 16) destination:MsgAddress
//           response_destination:MsgAddress custom_payload:(Maybe ^Cell)
//           forward_ton_amount:(VarUInteger 16) forward_payload:(Either Cell ^Cell)
//           = InternalMsgBody;
//  internal_transfer  query_id:uint64 amount:(VarUInteger 16) from:MsgAddress
//                     response_address:MsgAddress
//                     forward_ton_amount:(VarUInteger 16)
//                     forward_payload:(Either Cell ^Cell) 
//                     = InternalMsgBody;
//

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

    receive(msg: TokenTransferInternal) {

        // Check sender
        let ctx: Context = context();
        if (ctx.sender != self.master) {
            let sinit: StateInit = initOf JettonDefaultContract(self.master, msg.from);
            require(100, contractAddress(0, sinit.code, sinit.data) == ctx.sender);
        }

        // Update balance
        self.balance = self.balance + msg.amount;
        require(100, self.balance >= 0);
    }

    receive(msg: TokenTransfer) {

        // Check sender
        let ctx: Context = context();
        require(100, ctx.sender == self.owner);

        // Update balance
        self.balance = self.balance - msg.amount;
        require(100, self.balance >= 0);

        // Send notification
        let winit: StateInit = initOf JettonDefaultContract(self.master, msg.destination);
        let walletAddress: Address = contractAddress(0, winit.code, winit.data);
        send(SendParameters{
            to: walletAddress, 
            value: 0, 
            bounce: false,
            body: abi.pack_cell(TokenReceived{
                amount: msg.amount,
                queryId: msg.queryId,
                from: self.owner,
                responseAddress: self.owner,
                forwardTonAmount: 0
            }),
            code: winit.code,
            data: winit.data
        });
    }
}

trait Jetton with Ownable {
    totalSupply: Int;
    mintable: Bool;
    owner: Address;
    content: Cell?;

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
            body: abi.pack_cell(TokenTransferInternal{ 
                amount: amount,
                queryId: 0,
                from: myAddress(),
                responseAddress: myAddress(),
                forwardTonAmount: 0
            }),
            code: winit.code,
            data: winit.data
        });
    }

    receive(msg: Burned) {
        
        // Check wallet
        self.requireWallet(msg.owner);

        // Update supply
        self.totalSupply = self.totalSupply - msg.amount;
    }

    fun requireWallet(owner: Address) {
        let ctx: Context = context();
        let winit: StateInit = self.getJettonWalletInit(owner);
        require(100, contractAddress(0, winit.code, winit.data) == ctx.sender);
    }

    virtual fun getJettonWalletInit(address: Address): StateInit {
        return initOf JettonDefaultContract(myAddress(), address);
    }

    get fun get_wallet_address(owner: Address): Address {
        let winit: StateInit = self.getJettonWalletInit(owner);
        return contractAddress(0, winit.code, winit.data);
    }

    get fun get_jetton_data(): JettonData {
        return JettonData{ 
            totalSupply: self.totalSupply, 
            mintable: self.mintable, 
            owner: self.owner, 
            content: self.content, 
            walletCode: self.getJettonWalletInit(myAddress()).code 
        };
    }
}

trait JettonWallet with Ownable {
    master: Address;
    owner: Address;
    balance: Int;

    receive(msg: TokenTransferInternal) {

        // Check message
        let ctx: Context = context();
        require(100, (ctx.sender == self.master));

        // Update state
        self.balance = self.balance + msg.amount;
    }
}