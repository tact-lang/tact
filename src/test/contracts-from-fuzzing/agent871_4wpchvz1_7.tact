struct InnerA {
    n: Int;
    x: Bool?;
}

struct InnerB {
    s: String?;
    addr: Address;
}

struct Combined {
    a: InnerA;
    b: InnerB;
    optional_b: InnerB?;
}

contract OptionalNested {
    combined: Combined;

    init() {
        self.combined = Combined{
            a: InnerA{ n: 5, x: null },
            b: InnerB{ s: null, addr: myAddress() },
            optional_b: null
        };
    }
}