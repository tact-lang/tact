struct ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
}

contract ManyOptionalFieldsContract {
    s: ManyOptionalFields;
    init() {
        self.s = ManyOptionalFields {
            a: null,
            b: null,
            c: null,
            d: true,
            e: false,
            f: null
        };
    }
}