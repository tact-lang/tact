import "@stdlib/ownable";
import "./messages";

contract JettonDefaultWallet {
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
            let sinit: StateInit = initOf JettonDefaultWallet(self.master, msg.from);
            require(contractAddress(0, sinit.code, sinit.data) == ctx.sender);
        }

        // Update balance
        self.balance = self.balance + msg.amount;
        require(self.balance >= 0);
    }

    receive(msg: TokenTransfer) {

        // Check sender
        let ctx: Context = context();
        require(ctx.sender == self.owner);

        // Update balance
        self.balance = self.balance - msg.amount;
        require(self.balance >= 0);

        // Send notification
        let winit: StateInit = initOf JettonDefaultWallet(self.master, msg.destination);
        let walletAddress: Address = contractAddress(0, winit.code, winit.data);
        send(SendParameters{
            to: walletAddress, 
            value: 0, 
            bounce: false,
            body: abi.pack_cell(TokenTransferInternal{
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