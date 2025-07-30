struct NestedWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "a";
}

contract StructDefaults {
    f: NestedWithDefaults;

    init() {
        self.f = NestedWithDefaults{};
    }
}