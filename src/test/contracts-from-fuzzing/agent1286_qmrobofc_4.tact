struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
}

contract ManyFieldsContract {
    s: ManyFields;
    
    init() {
        self.s = ManyFields{
            a: 1, b: true, c: "x", d: null, e: null, f: "y"
        };
    }
}