struct StructDefaults {
    a: Int = 10;
    b: Bool = true;
}

contract DefaultsTest {
    data: StructDefaults;

    init() {
        self.data = StructDefaults{};
    }

    receive() {
        self.data = StructDefaults{a: 99, b: false};
    }
}