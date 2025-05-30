struct ComplexDefault {
    a: Int = 42;
    b: Bool = true;
    s: String = "hello";
}

contract DefaultsTest {
    data: ComplexDefault;
    init() {
        self.data = ComplexDefault{};
    }
}