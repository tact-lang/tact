struct ComplexDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestDefaults {
    d: ComplexDefaults;

    init() {
        self.d = ComplexDefaults{};
    }
}