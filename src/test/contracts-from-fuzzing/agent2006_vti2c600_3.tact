struct DeepNest3 {
    a: Int;
}

struct DeepNest2 {
    b: DeepNest3;
    c: Bool;
}

struct DeepNest1 {
    d: DeepNest2;
    e: String;
}

contract DeepNestedContract {
    nest: DeepNest1;
    init() {
        self.nest = DeepNest1 {
            d: DeepNest2 {
                b: DeepNest3 {
                    a: 42,
                },
                c: true,
            },
            e: "hi",
        };
    }
}