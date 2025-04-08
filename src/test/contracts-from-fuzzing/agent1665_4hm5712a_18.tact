struct HasAddresses {
    a1: Address;
    a2: Address?;
}

contract Test18 {
    data: HasAddresses;

    init() {
        self.data = HasAddresses{
            a1: myAddress(),
            a2: null
        };
    }
}