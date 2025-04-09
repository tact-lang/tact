struct StrNest {
    inner: String;
}

struct Outer {
    a: Int;
    nested: StrNest;
    another: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: 5,
            nested: StrNest{ inner: "nested" },
            another: false,
        };
    }
}
