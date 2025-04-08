struct StructWithDefaults {
    foo: Int = 0;
    bar: Bool = true;
    baz: String = "default";
}

contract WithDefaults {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{};
    }
}
