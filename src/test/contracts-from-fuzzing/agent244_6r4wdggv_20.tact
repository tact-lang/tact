struct ComplexDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    o: Int? = null;
}

contract UseComplexDefaults {
    t: ComplexDefaults;

    init() {
        self.t = ComplexDefaults{};
    }
}