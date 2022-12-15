import "@stdlib/ownable";
import "./messages";

trait Jetton with Ownable {

    //
    // Storage
    //

    totalSupply: Int;
    mintable: Bool;
    owner: Address;
    content: Cell?;

    //
    // Receivers
    //

    receive(msg: JettonUpdateContent) {

        // Allow changing content only by owner
        self.requireOwner();
        
        // Update content
        self.content = msg.content;
    }

    receive(msg: TokenBurned) {
        
        // Check wallet
        self.requireWallet(msg.owner);

        // Update supply
        self.totalSupply = self.totalSupply - msg.amount;
    }


    //
    // Get Methods
    //

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

    //
    // Private Methods
    //

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

    fun requireWallet(owner: Address) {
        let ctx: Context = context();
        let winit: StateInit = self.getJettonWalletInit(owner);
        require(contractAddress(0, winit.code, winit.data) == ctx.sender);
    }

    virtual fun getJettonWalletInit(address: Address): StateInit {
        return initOf JettonDefaultWallet(myAddress(), address);
    }
}