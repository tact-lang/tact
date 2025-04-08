struct StructWithDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "default";
}

contract DefaultsTest {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{};
    }
}