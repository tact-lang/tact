struct SOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructField {
    data: SOpt;

    init() {
        self.data = SOpt{ foo: null, bar: null };
    }
}