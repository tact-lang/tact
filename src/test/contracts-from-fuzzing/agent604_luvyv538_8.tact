struct InnerNested {
    a: Int;
    b: Bool?;
}

struct OuterNested {
    c: InnerNested?;
    d: String;
}

contract OptionalNested {
    value: OuterNested;

    init() {
        self.value = OuterNested{
            c: null,
            d: "hello"
        };
    }
}