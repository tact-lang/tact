struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract ManyOptionalFields {
    data: MultipleOptionals;

    init() {
        self.data = MultipleOptionals{
            a: null,
            b: true,
            c: null,
            d: 123,
            e: null
        };
    }
}
