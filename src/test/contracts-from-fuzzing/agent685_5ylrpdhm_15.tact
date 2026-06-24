struct ComplexOptional {
    a: Int?;
    b: Bool;
    c: String?;
}

contract HasComplexOptional {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{ a: null, b: false, c: null };
    }
}