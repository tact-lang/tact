struct NestedDefaults {
    n: Int = 42;
    s: String = "hi";
    f: Bool = false;
}

contract StructWithDefaults {
    foo: NestedDefaults;

    init() {
        self.foo = NestedDefaults{};
    }
}