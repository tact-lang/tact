contract NestedOptionalRoot {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{
            a: SomeOpt{
                a: null,
                b: null,
            }
        };
    }
}

struct NestedOpt {
    a: SomeOpt;
}

struct SomeOpt {
    a: Int?;
    b: Bool?;
}