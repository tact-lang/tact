struct DefaultsTest {
    a: Int = 7;
    b: Bool = false;
    c: String = "hello";
    d: Int? = null;
}

contract DefaultStructFields {
    val: DefaultsTest;

    init() {
        self.val = DefaultsTest{};
    }
}