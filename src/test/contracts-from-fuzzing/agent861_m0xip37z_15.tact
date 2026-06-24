struct HasManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ManyStructFields {
    s: HasManyFields;

    init() {
        self.s = HasManyFields{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: null,
            f: null,
        };
    }
}
