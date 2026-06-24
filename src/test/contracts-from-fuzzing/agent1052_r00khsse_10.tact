struct ComplexDefaults {
    x: Int = 42;
    y: String = "default";
    z: Bool = true;
}

contract DefaultVals {
    data: ComplexDefaults;

    init() {
        self.data = ComplexDefaults{};
    }
}