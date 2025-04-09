struct ComplexDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "test";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultedFields {
    s: ComplexDefaults;

    init() {
        self.s = ComplexDefaults{};
    }
}