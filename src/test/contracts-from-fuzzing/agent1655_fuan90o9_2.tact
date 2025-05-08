struct InnerNested {
    val1: Int;
    val2: String;
}

struct Nested {
    inner: InnerNested;
    optInner: InnerNested?;
    flag: Bool;
}

contract TestNested {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerNested{ val1: 1, val2: "a" },
            optInner: null,
            flag: false,
        };
    }
}
