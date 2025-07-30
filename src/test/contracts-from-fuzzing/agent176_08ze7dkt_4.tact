struct TestStruct {
    a: Int?;
    b: Bool;
    c: String;
    d: Int as uint32;
    e: Bool?;
    f: String;
    g: Int;
    h: Int?;
    i: String;
}

contract ManyOptionalFields {
    s: TestStruct;
    
    init() {
        self.s = TestStruct{
            a: null,
            b: true,
            c: "C",
            d: 4,
            e: false,
            f: "F",
            g: 7,
            h: null,
            i: "I",
        };
    }
}