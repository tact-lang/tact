struct WithAddresses {
    one: Address;
    two: Address?;
}

contract AddressHolder {
    data: WithAddresses;

    init() {
        let addr = myAddress();
        self.data = WithAddresses{
            one: addr,
            two: null
        };
    }
}
