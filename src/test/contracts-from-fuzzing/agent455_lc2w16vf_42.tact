struct ComplexOptionalDefault {
    i: Int = 5;
    j: Int? = null;
    b: Bool? = true;
    s: String? = null;
}

contract ComplexOptDef {
    data: ComplexOptionalDefault;

    init() {
        self.data = ComplexOptionalDefault{};
    }
}