struct WithAddresses {
    addr1: Address;
    addr2: Address;
}

contract TestContract {
    data: WithAddresses;

    init() {
        self.data = WithAddresses{
            addr1: myAddress(),
            addr2: myAddress()
        };
    }
}