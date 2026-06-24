struct SimpleStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: String;
    h: Int;
    i: Bool;
    j: String;
}

contract ManyFieldsContract {
    s: SimpleStruct;
    
    init() {
        self.s = SimpleStruct{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: null,
            f: "y",
            g: "z",
            h: 2,
            i: false,
            j: "w",
        };
    }
}