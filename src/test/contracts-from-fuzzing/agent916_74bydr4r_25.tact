message(123456) Big {
    a: Int as uint64;
    b: Bool;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract Test {
    saved: Big;

    init() {
        self.saved = Big{
            a: 42,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}