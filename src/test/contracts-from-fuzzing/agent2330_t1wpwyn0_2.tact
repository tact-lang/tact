struct ComplexOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    data: ComplexOptionals;

    init() {
        self.data = ComplexOptionals{ a: null, b: null, c: null };
    }
}
