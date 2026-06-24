struct ComplexDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
    e: String?;
}

contract TestContract {
    x: ComplexDefaults = ComplexDefaults{};

    init() {
        self.x = ComplexDefaults{};
    }
}