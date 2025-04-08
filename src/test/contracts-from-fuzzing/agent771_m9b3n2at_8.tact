struct TestDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultsTest {
    record: TestDefaults;

    init() {
        self.record = TestDefaults{};
    }
}