struct NestedDeepA {
    a1: Int;
    a2: String;
}

struct NestedDeepB {
    b1: NestedDeepA;
    b2: Int?;
}

struct NestedDeepC {
    c1: NestedDeepB;
    c2: Bool?;
}

struct NestedDeepD {
    d1: NestedDeepC;
    d2: Int;
}

contract DeeplyNestedPersistent {
    storage: NestedDeepD;

    init() {
        self.storage = NestedDeepD{
            d1: NestedDeepC{
                c1: NestedDeepB{
                    b1: NestedDeepA{ a1: 1, a2: "x" },
                    b2: 42,
                },
                c2: true,
            },
            d2: 100,
        };
    }
}
