struct SemiComplex {
    name: String?;
    flag: Bool?;
    nested: Inner?;
}

struct Inner {
    n: Int?;
    leaf: Leaf?;
}

struct Leaf {
    z: String?;
}

contract ComplexOptMix {
    store: SemiComplex;

    init() {
        self.store = SemiComplex{
            name: "hi",
            flag: true,
            nested: Inner{
                n: 50,
                leaf: Leaf{
                    z: "leaf",
                },
            },
        };
    }
}
