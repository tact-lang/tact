struct HasAddresses {
    a1: Address;
    a2: Address?;
}

contract PersistAddresses {
    record: HasAddresses;

    init() {
        self.record = HasAddresses{a1: myAddress(), a2: null};
    }
}