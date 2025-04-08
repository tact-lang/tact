struct InnerNested {
    x: Int;
    y: Int?;
}

struct OuterNested {
    inner: InnerNested;
    flag: Bool;
}

contract NestedStructStorage {
    s: OuterNested;

    init() {
        self.s = OuterNested{
            inner: InnerNested{ x: 10, y: null },
            flag: true
        };
    }
}