struct StructWithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract WithDefaults {
    field: StructWithDefaults;

    init() {
        self.field = StructWithDefaults{};
    }
}
