struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract MixedFields {
    field: Combo;

    init() {
        self.field = Combo{
            a:1,
            b:null,
            c:"world",
            d:null,
            e:true,
            f:null
        };
    }
}