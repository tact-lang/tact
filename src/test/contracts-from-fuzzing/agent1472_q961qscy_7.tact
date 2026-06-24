struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsTest {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}
