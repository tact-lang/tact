struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Outer {
    d: String;
    e: Inner;
    f: Bool;
}

contract NestedMixed {
    data: Outer;

    init() {
        self.data = Outer{
            d: "hi",
            e: Inner{ a: 1, b: true, c: null },
            f: false
        };
    }
}