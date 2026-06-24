struct ComplexDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;
}

contract DefaultedStructTest {
    x: ComplexDefaults;

    init() {
        self.x = ComplexDefaults{};
    }
}