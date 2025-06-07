struct DeepVariant {
    a: Int;
    b: Nested1;
}

struct Nested1 {
    c: Nested2;
    d: Int?;
}

struct Nested2 {
    e: Int?;
    f: Nested3;
}

struct Nested3 {
    g: Int;
    h: String?;
}

contract ComplexDeep {
    store: DeepVariant;

    init() {
        self.store = DeepVariant{
            a: 11,
            b: Nested1{
                c: Nested2{
                    e: null,
                    f: Nested3{
                        g: 7,
                        h: null
                    }
                },
                d: null
            }
        };
    }
}