struct ComplexDefault {
    str: String = "hello";
    flag: Bool = false;
}

contract ComplexStructDefault {
    field: ComplexDefault = ComplexDefault{};

    init() {
        self.field = ComplexDefault{};
    }
}
