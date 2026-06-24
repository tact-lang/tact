struct NestedDefaults {
    a: Int = 10;
    b: Bool = false;
}

contract DefaultStructFieldTest {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}
