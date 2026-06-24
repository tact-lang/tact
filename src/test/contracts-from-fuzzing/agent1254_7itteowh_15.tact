struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
}

contract StructDefaultsTest {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{};
    }
}