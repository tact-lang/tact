struct ComplexDefaults {
    a: Int = 11;
    b: Bool = true;
    c: String = "default";
    d: Int?; // optional, default null
    e: String?; // optional, default null
}

contract DefaultValues {
    data: ComplexDefaults;

    init() {
        self.data = ComplexDefaults{};
    }
}