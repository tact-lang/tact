struct ComplexDefaults {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
    d: Int?;
    e: String? = null;
    f: Bool? = false;
}

contract TestContract {
    field: ComplexDefaults;

    init() {
        self.field = ComplexDefaults{
            d: 123,
        };
    }
}
