struct NestedDefaults {
    foo: Int = 1;
    bar: Bool = false;
}

struct OuterDefault {
    inner: NestedDefaults;
}

contract StructNestedDefaults {
    v: OuterDefault;

    init() {
        self.v = OuterDefault{ inner: NestedDefaults{} };
    }
}
