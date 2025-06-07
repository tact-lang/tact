struct BigNested {
    nested1: Nested;
    nested2: Nested?;
    optInt: Int?;
    plainBool: Bool;
}

struct Nested {
    a: Int;
    b: Bool;
    c: String;
    d: DeepNested;
}

struct DeepNested {
    flag: Bool;
    text: String;
}

contract Test {
    bn: BigNested;

    init() {
        self.bn = BigNested{
            nested1: Nested{
                a: 7,
                b: false,
                c: "ok",
                d: DeepNested{flag: true, text: "deep"},
            },
            nested2: null,
            optInt: null,
            plainBool: true,
        };
    }
}
