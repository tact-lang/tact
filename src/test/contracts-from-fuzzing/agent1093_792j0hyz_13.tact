struct FieldsWithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalFields {
    s: FieldsWithOptionals;

    init() {
        self.s = FieldsWithOptionals{
            a: null,
            b: null,
            c: null,
            d: 10,
            e: true,
            f: "hi"
        };
    }
}