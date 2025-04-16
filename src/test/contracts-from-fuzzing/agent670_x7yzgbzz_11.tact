struct DefaultsTest {
    a: Int = 10;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = false;
}

contract DefaultVals {
    val: DefaultsTest;

    init() {
        self.val = DefaultsTest{};
    }
}