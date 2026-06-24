struct NestedStringOpt {
    s: String?;
}

struct BigNest {
    a: NestedStringOpt;
    b: NestedStringOpt;
    c: NestedStringOpt;
}

contract OptionalNestExample {
    nest: BigNest;

    init() {
        self.nest = BigNest{
            a: NestedStringOpt{ s: "hi" },
            b: NestedStringOpt{ s: null },
            c: NestedStringOpt{ s: "hello" },
        };
    }
}
