struct AddrDefaults {
    a: Address?;
    b: Address;
}

contract AddressDefaults {
    val: AddrDefaults;
    init() {
        self.val = AddrDefaults{a: null, b: myAddress()};
    }
}