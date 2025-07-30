struct OptTuple {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract TestContract {
    opts: OptTuple = OptTuple{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
    };

    init() {
        self.opts = OptTuple{
            a: 7,
            b: true,
            c: "hello",
            d: null,
            e: null,
        };
    }
}