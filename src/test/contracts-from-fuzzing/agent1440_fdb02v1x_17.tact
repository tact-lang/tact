struct WithAddress {
    addr: Address;
    maybeAddr: Address?;
}

contract AddressStore {
    data: WithAddress;

    init() {
        self.data = WithAddress{
            addr: myAddress(),
            maybeAddr: null
        };
    }
}