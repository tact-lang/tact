struct NestedDefaults {
    sub: InnerWithDefaults;
}

struct InnerWithDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract TestContract {
    nested: NestedDefaults;

    init() {
        self.nested = NestedDefaults{
            sub: InnerWithDefaults{}
        };
    }
}