struct DefaultVals {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsTest {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}