struct InnerNested {
    a: Int;
    b: Int;
}

struct MiddleNested {
    inner: InnerNested;
    c: Int;
}

struct OuterNested {
    middle: MiddleNested;
    d: Int;
}

contract TestContract {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            middle: MiddleNested{ inner: InnerNested{ a:1, b:2 }, c:3 },
            d:4
        };
    }
}