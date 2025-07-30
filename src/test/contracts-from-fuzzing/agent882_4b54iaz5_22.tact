struct OptionalAddresses {
    a: Address?;
    b: Address?;
    c: Address?;
    d: Address?;
}

contract OptAddrContract {
    val: OptionalAddresses;

    init() {
        self.val = OptionalAddresses{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}