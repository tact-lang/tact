struct WithLotsOfOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptionalStorage {
    foo: Int;
    bar: WithLotsOfOptionals;
    maybeFlag: Bool?;

    init() {
        self.foo = 7;
        self.bar = WithLotsOfOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
        self.maybeFlag = null;
    }
}
