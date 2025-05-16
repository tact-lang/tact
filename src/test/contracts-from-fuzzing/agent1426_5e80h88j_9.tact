struct OptionalAddress {
    a: Address?;
    b: Address?;
    c: Address?;
}

contract AddrOptContract {
    s: OptionalAddress;

    init() {
        self.s = OptionalAddress{
            a: null,
            b: null,
            c: null,
        };
    }
}