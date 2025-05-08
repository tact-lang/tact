struct DefaultsTest {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract StructDefaults {
    val: DefaultsTest;

    init() {
        self.val = DefaultsTest{};
    }
}