struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsCombo {
    data: MultipleOptionals;
    n: Int;

    init() {
        self.data = MultipleOptionals {
            a: null,
            b: true,
            c: null
        };
        self.n = 12;
    }
}