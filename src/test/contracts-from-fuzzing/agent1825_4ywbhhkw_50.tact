struct DefaultsTest {
    x: Int = 42;
    s: String = "hello";
    b: Bool = false;
}

contract DefaultsInner {
    val: DefaultsTest;
    init() {
        self.val=DefaultsTest{};
    }
}
