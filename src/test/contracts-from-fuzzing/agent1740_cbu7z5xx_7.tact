struct NestedOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Container {
    nested: NestedOptionals;
    f4: Int?;
    f5: Bool?;
}

contract ComplexOptionals {
    data: Container;

    init() {
        self.data = Container {
            nested: NestedOptionals { f1: null, f2: null, f3: null },
            f4: null,
            f5: null
        };
    }
}