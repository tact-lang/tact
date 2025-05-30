struct InnerNested {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterNested {
    nested: InnerNested;
    flag: Bool;
}

contract ComplexStorage {
    data: OuterNested;
    init() {
        self.data = OuterNested{
            nested: InnerNested{ a: 42, b: true, c: "abc" },
            flag: false,
        };
    }
}