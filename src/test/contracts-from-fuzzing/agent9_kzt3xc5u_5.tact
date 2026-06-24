struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: InnerNested;
    e: String?;
}

struct InnerNested {
    flag: Bool;
    value: Int?;
    text: String;
}

contract MultiNestedTest {
    storage: BigNested;

    init() {
        self.storage = BigNested{
            a: 10,
            b: false,
            c: "hi",
            d: InnerNested{
                flag: true,
                value: null,
                text: "inner"
            },
            e: null
        };
    }
}