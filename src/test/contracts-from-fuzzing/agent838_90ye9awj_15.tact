struct DefaultsTest {
    x: Int = 5;
    y: Bool = true;
    z: String = "test";
}

contract TestContract {
    data: DefaultsTest;
    init() {
        self.data = DefaultsTest{};
    }
}