message Request {
    to: Address;
    amount: Int;
    body: Cell?;
}

contract MultisigSigner {

    master: Address;
    weight: Int = 0;
    requiredWeight: Int;
    members: map[Address]Int;
    to: Address;
    amount: Int;
    body: Cell?;

    init(master: Address, members: map[Address]Int, requiredWeight: Int, request: Request) {
        self.members = members;
        self.to = request.to;
        self.amount = request.amount;
        self.body = request.body;
        self.master = master;
        self.requiredWeight = requiredWeight;
    }
}

contract Multisig {
    seqno: Int;
    members: map[Address]Int;
    totalWeight: Int;
    requiredWeight: Int;

    init(members: map[Address]Int, requiredWeight: Int) {
        self.members = members;
        self.requiredWeight = requiredWeight;
        self.totalWeight = 0;
    }

    // Request new pending transaction
    receive(msg: Request) {
        let ctx: Context = context();

    }
}