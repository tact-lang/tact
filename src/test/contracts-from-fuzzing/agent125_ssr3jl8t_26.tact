struct InnerNested {
    num: Int;
    flag: Bool;
}

struct OuterNested {
    inner: InnerNested;
    text: String;
}

contract ComplexNested {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            inner: InnerNested{ num: 123, flag: true },
            text: "hi"
        };
    }
}