struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: String?;
    e: Bool?;
    f: String?;
}

contract ManyOptionals {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}