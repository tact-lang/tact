struct DefaultsTest {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract Test {
    data: DefaultsTest;

    init() {
        self.data = DefaultsTest{};
    }
}