struct FieldDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
}

contract FieldDefaultsTest {
    data: FieldDefaults;

    init() {
        self.data = FieldDefaults{};
    }
}