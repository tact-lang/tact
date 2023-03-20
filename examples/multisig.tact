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
    members: map<Address, Int>;
    weight: Int = 0;
    requiredWeight: Int;
    completed: Bool;
    
    // Request
    request: Request;

    init(master: Address, members: map<Address, Int>, requiredWeight: Int, request: Request) {
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
        require(self.request.timeout > now(), "Timeout");
        require(!self.completed, "Completed");

        // Load weitght
        let sender: Address = sender();
        let weight: Int = self.members.get(sender)!!;
        self.members.set(sender, null);

        // Update weight
        self.weight = self.weight + weight;
        if (self.weight >= self.requiredWeight) {
            self.completed = true;
            send(SendParameters{
                value: 0, 
                to: self.master, 
                mode: SendRemainingBalance + SendIgnoreErrors, 
                bounce: false, 
                body: Signed{ request: self.request }.toCell()
            });
        }
    }

    get fun request(): Request {
        return self.request;
    }
}

contract Multisig {
    seqno: Int;
    members: map<Address, Int>;
    totalWeight: Int;
    requiredWeight: Int;

    init(members: map<Address, Int>, totalWeight: Int, requiredWeight: Int) {
        self.members = members;
        self.requiredWeight = requiredWeight;
        self.totalWeight = totalWeight;
        self.totalWeight = 0;
        self.seqno = 0;
    }

    // Request new pending transaction
    receive(msg: Request) {

        // Check sender
        let sender: Address = sender();
        let weight: Int = self.members.get(sender)!!;
        require(weight > 0, "Not a member");

        // Create message
        let opInit: StateInit = initOf MultisigSigner(myAddress(), self.members, self.requiredWeight, msg);
        let opAddress: Address = contractAddress(opInit);
        send(SendParameters{
            value: 0, 
            to: opAddress, 
            mode: SendRemainingValue + SendIgnoreErrors, 
            bounce: true,
            code: opInit.code,
            data: opInit.data
        });
    }

    receive(msg: Signed) {

        // Check parameters
        // NOTE: this will check members, required weight, master address
        let sender: Address = sender();
        let opInit: StateInit = initOf MultisigSigner(myAddress(), self.members, self.requiredWeight, msg.request);
        let opAddress: Address = contractAddress(opInit);
        require(opAddress == sender, "Invalid sender");
        require(msg.request.timeout > now(), "Timeout");

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
        return self.members.get(address);
    }

    get fun members(): map<Address, Int> {
        return self.members;
    }
}