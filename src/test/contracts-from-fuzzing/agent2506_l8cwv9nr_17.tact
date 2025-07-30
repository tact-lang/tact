struct DefaultTest {
    flag: Bool = false;
    text: String = "abc";
    num: Int = 42;
}

contract TestDefaults {
    data: DefaultTest;

    init() {
        self.data = DefaultTest{};
    }
}
