struct S {
    a: Int;
    b: String?;
    c: Bool;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract OptionalPrimitives {
    s: S;
    init() {
        self.s = S{
            a: 10,
            b: null,
            c: true,
            d: null,
            e: null,
            f: null
        };
    }
}
