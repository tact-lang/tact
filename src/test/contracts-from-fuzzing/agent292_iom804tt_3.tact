struct ComplexOpt {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract OptionalTest {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{ foo: null, bar: true, text: null };
    }
}