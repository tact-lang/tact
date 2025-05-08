struct OptionalComplex {
    a: Int;  b: Bool;
}

contract OptionalComplexField {
    f: OptionalComplex?;

    init() {
        self.f = OptionalComplex{a: 5, b: true};
    }
}
