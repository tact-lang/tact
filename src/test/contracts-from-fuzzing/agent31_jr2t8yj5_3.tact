struct NestedDefaults {
    a: Int;
    b: InnerWithDefaults;
}

struct InnerWithDefaults {
    x: Int = 7;
    y: Bool? = null;
}

contract TestContract {
    nested: NestedDefaults;

    init() {
        self.nested = NestedDefaults{
            a: 1,
            b: InnerWithDefaults{},
        };
    }
}
