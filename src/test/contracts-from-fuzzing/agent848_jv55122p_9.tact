struct DefaultVals {
    val1: Int = 42;
    val2: Bool = false;
    val3: String = "hello";
}

contract DefaultsTest {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}