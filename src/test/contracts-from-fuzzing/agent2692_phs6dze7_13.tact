struct NestedWithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 7;
    y: Bool = false;
}

contract NestDefaults {
    d: NestedWithDefaults;

    init() {
        self.d = NestedWithDefaults{
            c: InnerDefaults{}
        };
    }
}
