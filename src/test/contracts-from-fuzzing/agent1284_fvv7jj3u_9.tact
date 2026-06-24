struct LargeNested {
    a: Int;
    b: Nested1;
    c: Nested2;
}

struct Nested1 {
    d: Bool;
    e: String;
}

struct Nested2 {
    f: Int?;
    g: String?;
}

contract LargeNestedContract {
    nested: LargeNested;

    init() {
        self.nested = LargeNested{
            a: 7,
            b: Nested1{
                d: false,
                e: "nest",
            },
            c: Nested2{
                f: null,
                g: "hi",
            },
        };
    }
}