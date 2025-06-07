struct ComplexFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixFieldsContract {
    state: ComplexFields;

    init() {
        self.state = ComplexFields{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null
        };
    }
}
