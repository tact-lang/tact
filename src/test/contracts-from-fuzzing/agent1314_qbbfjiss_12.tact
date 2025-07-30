struct FieldDefaults {
    s: String = "hi";
    x: Int = 99;
    b: Bool = true;
}

contract DefaultsTest {
    fd: FieldDefaults;

    init() {
        self.fd = FieldDefaults{};
    }
}