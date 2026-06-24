struct OptionalAddress {
    a: Address?;
    b: Address?;
    c: Address?;
}

contract OptAddrContract {
    data: OptionalAddress;

    init() {
        self.data = OptionalAddress{
            a: null,
            b: null,
            c: null,
        };
    }
}