struct DefaultValues {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultsTest {
    d: DefaultValues;

    init() {
        self.d = DefaultValues{};
    }
}
