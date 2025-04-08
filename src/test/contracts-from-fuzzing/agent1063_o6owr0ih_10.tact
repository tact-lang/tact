struct ComplexDefault {
    a: Int = 17;
    b: Bool? = null;
    c: String = "abc";
    d: Address? = null;
}

contract DefaultVals {
    field: ComplexDefault;

    init() {
        self.field = ComplexDefault{};
    }
}