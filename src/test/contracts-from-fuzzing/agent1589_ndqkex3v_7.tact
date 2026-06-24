struct DefaultsTest {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultValues {
    x: DefaultsTest;

    init() {
        self.x = DefaultsTest{};
    }
}