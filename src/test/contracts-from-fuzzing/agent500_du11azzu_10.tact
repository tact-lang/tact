struct DefaultValues {
    a: Int = 5;
    b: Bool = true;
    c: String = "default string";
}

contract DefaultsTest {
    data: DefaultValues;
    init() {
        self.data = DefaultValues{};
    }
    receive() {}
}