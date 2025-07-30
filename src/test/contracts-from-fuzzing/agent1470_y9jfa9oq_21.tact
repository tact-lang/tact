struct SimpleDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultsTest {
    data: SimpleDefaults;

    init() {
        self.data = SimpleDefaults{};
    }
}