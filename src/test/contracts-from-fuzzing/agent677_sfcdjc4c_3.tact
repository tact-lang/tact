struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestNestedOpt {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }

    receive() {
        let _ = self.s.a;
    }
}