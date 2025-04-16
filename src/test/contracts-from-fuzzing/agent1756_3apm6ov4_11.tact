struct StructWithDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "hello";
    opt: Int? = null;
}

contract WithDefaults {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{};
    }
}
