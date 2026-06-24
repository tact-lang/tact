struct ComplexDefaults {
    i: Int = 42;
    b: Bool = false;
    s: String = "default";
}

contract DefaultsContract {
    data: ComplexDefaults;

    init() {
        self.data = ComplexDefaults{};
    }
}
