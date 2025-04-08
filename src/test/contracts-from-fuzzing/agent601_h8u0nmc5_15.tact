struct WithAddress {
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

contract Addressed {
    store: WithAddress;

    init() {
        self.store = WithAddress{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress(),
        };
    }
}
