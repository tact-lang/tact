contract ContractC {
    receive() {
        dump(300);
    }
}

contract ContractB {
    state: Address; // holds the address of ContractC
    init() {
        self.state = address("0:3333333333333333333333333333333333333333333333333333333333333333");
    }
    receive() {
        send(SendParameters{
            to: self.state,
            value: ton("0.1"),
            mode: 0,
            body: "From B".asComment()
        });
    }
}

contract ContractA {
    state: Address; // holds the address of ContractB
    init() {
        self.state = address("0:2222222222222222222222222222222222222222222222222222222222222222");
    }
    receive() {
        send(SendParameters{
            to: self.state,
            value: ton("0.1"),
            mode: 0,
            body: "From A".asComment()
        });
    }
}
