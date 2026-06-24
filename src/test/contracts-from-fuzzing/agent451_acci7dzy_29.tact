struct WithAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
}

contract AddressStructTest {
    data: WithAddresses;

    init() {
        let addr = myAddress();
        self.data = WithAddresses{ a1: addr, a2: addr, a3: addr };
    }
}