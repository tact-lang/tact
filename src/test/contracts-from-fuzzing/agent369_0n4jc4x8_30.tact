struct StructWithDefaults {
    x: Int = 10;
    y: Bool = true;
    s: String = "default";
}

contract TestWithDefaults {
    field: StructWithDefaults;

    init() {
        self.field = StructWithDefaults{};
    }
}