struct NullableAddresses {
    a1: Address?;
    a2: Address?;
    a3: Address?;
}

contract NullableAddrContract {
    storage: NullableAddresses;
    init() {
        self.storage = NullableAddresses{
            a1: null, a2: null, a3: null
        };
    }
}