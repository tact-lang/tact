message Request {
    requested: Address;
    to: Address;
    value: Int as coins;
    timeout: Int as uint32;
    bounce: Bool;
    mode: Int as uint8;
    body: Cell?;
}

message Signed {
    request: Request;
}

contract MultisigSigner {

    master: Address;

    // Voting state
    members: map[Address]Int;
    weight: Int = 0;
    requiredWeight: Int;
    completed: Bool;
    
    // Request
    request: Request;

    init(master: Address, members: map[Address]Int, requiredWeight: Int, request: Request) {
        self.master = master;
        self.members = members;
        self.requiredWeight = requiredWeight;
        self.completed = false;
        self.request = request;
    }

    receive() {
        // Do nothing
    }

    receive("YES") {

        // Checks
        require(self.request.timeout > now());
        require(!self.completed);

        // Load weitght
        let ctx: Context = context();
        let weight: Int = self.members.get2(ctx.sender)!!;
        self.members.set(ctx.sender, null);

        // Update weight
        self.weight = self.weight + weight;
        if self.weight >= self.requiredWeight {
            self.completed = true;
            send(SendParameters{
                value: 0, 
                to: self.master, 
                mode: 128 + 2, 
                bounce: false, 
                body: abi.pack_cell(Signed{ request: self.request })
            });
        }
    }

    get fun request(): Request {
        return self.request;
    }
}

contract Multisig {
    seqno: Int;
    members: map[Address]Int;
    totalWeight: Int;
    requiredWeight: Int;

    init(members: map[Address]Int, totalWeight: Int, requiredWeight: Int) {
        self.members = members;
        self.requiredWeight = requiredWeight;
        self.totalWeight = totalWeight;
        self.totalWeight = 0;
    }

    // Request new pending transaction
    receive(msg: Request) {

        // Check sender
        let ctx: Context = context();
        let weight: Int = self.members.get2(ctx.sender)!!;
        require(weight > 0);

        // Create message
        let opInit: StateInit = initOf MultisigSigner(myAddress(), self.members, self.requiredWeight, msg);
        let opAddress: Address = contractAddress(0, opInit.code, opInit.data);
        send(SendParameters{
            value: 0, 
            to: opAddress, 
            mode: 64 + 2, 
            bounce: true,
            code: opInit.code,
            data: opInit.data
        });
    }

    receive(msg: Signed) {

        // Check parameters
        // NOTE: this will check members, required weight, master address
        let ctx: Context = context();
        let opInit: StateInit = initOf MultisigSigner(myAddress(), self.members, self.requiredWeight, msg.request);
        let opAddress: Address = contractAddress(0, opInit.code, opInit.data);
        require(opAddress == ctx.sender);
        require(msg.request.timeout > now());

        // Send operation
        send(SendParameters{
            to: msg.request.to, 
            value: msg.request.value, 
            mode: msg.request.mode, 
            bounce: msg.request.bounce, 
            body: msg.request.body
        });
    }

    get fun member(address: Address): Int? {
        return self.members.get2(address);
    }

    get fun members(): map[Address]Int {
        return self.members;
    }
}