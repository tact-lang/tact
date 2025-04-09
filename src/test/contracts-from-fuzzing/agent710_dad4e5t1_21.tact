struct ComplexDefaults {
    a: Int = 7;
    b: Bool? = null;
    c: String = "hi";
    d: String? = null;
}

contract TestContract {
    field: ComplexDefaults = ComplexDefaults{};

    init() {
        self.field = ComplexDefaults{
            a: 8, b: true, c: "ho", d: "yo"
        };
    }
}