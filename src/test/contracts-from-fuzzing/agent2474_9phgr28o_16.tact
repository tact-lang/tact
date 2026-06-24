struct InnerMost {
    flag: Bool?;
    note: String?;
}

struct Inner {
    value: Int;
    deep: InnerMost;
}

struct Outer {
    plain: Int;
    maybe: Int?;
    nested: Inner;
}

contract ComplexMix {
    storage: Outer;

    init() {
        self.storage = Outer{
            plain: 10,
            maybe: null,
            nested: Inner{
                value: 20,
                deep: InnerMost{
                    flag: true,
                    note: "deep inside",
                },
            }
        };
    }
}
