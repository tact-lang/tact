struct TestDefault {
    foo: Int = 1;
    bar: Bool? = null;
    baz: String = "baz";
}

contract DefaultsCheck {
    s: TestDefault;

    init() {
        self.s = TestDefault{};
    }
}
