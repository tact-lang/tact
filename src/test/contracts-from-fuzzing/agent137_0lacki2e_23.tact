struct NestedDefaults {
    a: Int = 1;
    s: InnerWithDefaults;
}

struct InnerWithDefaults {
    x: Int = 42;
    y: Bool = false;
}

contract TestNestedDefaults {
    f: NestedDefaults;
    init() {
        self.f = NestedDefaults{
            s: InnerWithDefaults{}
        };
    }
}