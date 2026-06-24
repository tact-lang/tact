struct DefaultsTest {
    x: Int = 1;
    y: Bool = false;
    z: String = "hello";
    opt: Int? = null;
    flagOpt: Bool? = true;
}

contract TestContract {
    data: DefaultsTest;

    init() {
        self.data = DefaultsTest{};
    }
}