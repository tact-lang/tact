struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    nested1: Nested1;
}

struct Nested1 {
    f: Int;
    nested2: Nested2;
}

struct Nested2 {
    g: Bool;
    nested3: Nested3;
}

struct Nested3 {
    h: String;
    i: Bool?;
}

contract ComplexNestedContract {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: 10,
            b: false,
            c: "hello",
            d: null,
            e: true,
            nested1: Nested1{
                f: 42,
                nested2: Nested2{
                    g: true,
                    nested3: Nested3{
                        h: "world",
                        i: null
                    }
                }
            }
        };
    }
}