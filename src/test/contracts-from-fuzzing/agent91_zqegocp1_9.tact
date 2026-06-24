struct OptionalAddrs {
    a: Address?;
    b: Address?;
    c: Address?;
    d: Address?;
}

contract Test {
    x: OptionalAddrs;

    init() {
        self.x = OptionalAddrs{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}