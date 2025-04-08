struct OptPrims {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    foo: OptPrims;

    init() {
        self.foo = OptPrims{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}