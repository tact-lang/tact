struct NestedDefaults {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "hi";
}

contract ComplexDefaults {
    f1: Int = 42;
    f2: Bool = false;
    f3: String = "str";
    f4: NestedDefaults = NestedDefaults{};

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "baz";
        self.f4 = NestedDefaults{ foo: 9, bar: false, baz: "abc" };
    }
}