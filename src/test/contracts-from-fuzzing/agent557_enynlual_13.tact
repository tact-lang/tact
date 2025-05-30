struct DefaultsTest {
    foo: Int = 123;
    bar: String = "abc";
    flag: Bool = true;
}

contract TestContract {
    dt: DefaultsTest;
    init() {
        self.dt = DefaultsTest{};
    }
}