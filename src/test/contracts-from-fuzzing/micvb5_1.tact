message Add {
    queryId: Int as uint64;
    amount: Int as uint32;
}

contract SimpleCounter {
    id: Int as uint32;
    counter: Int as uint32;

    init(id: Int) {
        self.id = id;
        self.counter = 0;
    }

    // Empty receiver for the deployment
    receive() {
        cashback(sender());
    }

    receive(msg: Add) {
        self.counter += msg.amount;
        cashback(sender());
    }

    get fun counter(): Int {
        return self.counter;
    }

    get fun id(): Int {
        return self.id;
    }
}
