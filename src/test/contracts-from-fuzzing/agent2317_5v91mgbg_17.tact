struct DefaultsTest {
    a: Int = 1;
    b: String = "hi";
    c: Bool = false;
}

contract DefaultsAndInit {
    st: DefaultsTest;

    init() {
        self.st = DefaultsTest{a: 10, b: "hello", c: true};
    }
}