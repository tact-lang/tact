struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedFields {
    field: Mixed;
    
    init() {
        self.field = Mixed{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: null,
            f: null,
        };
    }
}
