struct WithAddresses {
    owner: Address;
    backup: Address?;
}

contract AddressFields {
    state: WithAddresses;

    init() {
        self.state = WithAddresses {
            owner: myAddress(),
            backup: null,
        };
    }
}