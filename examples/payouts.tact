import "@stdlib/ownable";

message CanPayout {
    amount: Int;
}

message CanPayoutResponse {
    amount: Int;
    address: Address;
    ok: Bool;
}

contract Beacon with Ownable {

    master: Address;
    owner: Address;
    completed: Bool;

    init(master: Address, owner: Address) {
        self.master = master;
        self.owner = owner;
        self.completed = false;
    }

    receive(msg: CanPayout) {

        // Check context
        let ctx: Context = context();
        require(ctx.sender == self.master, "Invalid sender");

        // Reserve funds
        nativeReserve(ton("0.1"), 0);

        // Send response
        if (self.completed) {
            self.completed = true;    
            reply(CanPayoutResponse{ok: true, amount: msg.amount, address: self.owner}.toCell());
        } else {
            reply(CanPayoutResponse{ok: false, amount: msg.amount, address: self.owner}.toCell());
        }        
    }

    bounced(msg: Slice) {
        // Reset completed flag is our message bounced
        self.completed = false;
    }
}

contract Payouts with OwnableTransferable {
    owner: Address;
    publicKey: Int;

    init(owner: Address, publicKey: Int) {
        self.owner = owner;
        self.publicKey = publicKey;
    }

    receive(msg: String) {

        // Check context
        let ctx: Context = context();
        require(ctx.value >= ton("1"), "Invalid value");

        // Parse message
        let data: Slice = msg.fromBase64();
        let amount: Int = data.loadCoins();
        let signature: Slice = data.loadBits(512);
        
        // Verify signature
        let dataToSign: Builder = beginCell();
        dataToSign = dataToSign.storeAddress(ctx.sender);
        dataToSign = dataToSign.storeCoins(amount);
        let hash: Int = dataToSign.asCell().hash();
        require(checkSignature(hash, signature, self.publicKey), "Invalid signature");

        // Request funds transfer
        let init: StateInit = initOf Beacon(myAddress(), ctx.sender);
        let address: Address = contractAddress(init);
        send(SendParameters{
            to: address, 
            value: 0, 
            mode: SendRemainingValue + SendIgnoreErrors, 
            bounce: true, 
            body: CanPayout{amount: amount}.toCell()
        });
    }

    receive(msg: CanPayoutResponse) {

        // Check context
        let ctx: Context = context();
        let init: StateInit = initOf Beacon(myAddress(), msg.address);
        let address: Address = contractAddress(init);
        require(ctx.sender == address, "Invalid sender");

        if (msg.ok) {
            
            // Check that we have enough funds
            require(myBalance() - ctx.value - ton("1") - msg.amount > 0, "Invalid balance");

            // Send response
            send(SendParameters{
                to: msg.address, 
                value: msg.amount, 
                mode: SendRemainingValue + SendIgnoreErrors, 
                bounce: false, 
                body: "Success".asComment()
            });
        } else {
            send(SendParameters{
                to: msg.address, 
                value: 0, 
                mode: SendRemainingValue + SendIgnoreErrors, 
                bounce: false, 
                body: "Already paid".asComment()
            });
        }
    }
}