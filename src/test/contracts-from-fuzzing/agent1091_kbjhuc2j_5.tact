struct DefaultsTest {
    x: Int = 10;
    y: Bool = true;
    z: String = "hello";
    opt: Int?; // should get null by default
}

contract TestDefaults {
    val: DefaultsTest;

    init() {
        self.val = DefaultsTest{};
    }
}