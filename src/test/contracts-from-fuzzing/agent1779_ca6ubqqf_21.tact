struct NestedDefaults {
    a: Int = 1;
    b: InnerWithDefaults;
}

struct InnerWithDefaults {
    c: Int = 2;
    d: String = "d";
}

contract DefaultNested {
    state: NestedDefaults;
    init() {
        self.state = NestedDefaults{b: InnerWithDefaults{}};
    }
}