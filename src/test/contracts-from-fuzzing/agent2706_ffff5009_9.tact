struct DefaultsTest {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Address? = null;
}

contract DefaultsContract {
    val: DefaultsTest;

    init() {
        self.val = DefaultsTest{};
    }
}