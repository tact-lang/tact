struct NestedInfo {
    addr: Address;
}

struct OuterState {
    nested: NestedInfo;
}

contract ContractB {
    receive() {}
}

contract ContractA {
    state: OuterState;
    init() {
        self.state = OuterState{
            nested: NestedInfo{
                addr: address("0:1111111111111111111111111111111111111111111111111111111111111111")
            }
        };
    }
    receive() {
        send(SendParameters{
            to: self.state.nested.addr,
            value: ton("0.1"),
            mode: 0,
            body: "Call from A".asComment(),
        });
    }
}
