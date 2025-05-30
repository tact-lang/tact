struct FieldOrderTest {
    a: Int as uint4;
    b: Bool;
    c: Int;
    d: String;
    e: Int; 
    f: String;
    g: Bool;
    h: Int as int32;
}

contract DifferentSerializations {
    val: FieldOrderTest;
    
    init() {
        self.val = FieldOrderTest{
            a: 8,
            b: true,
            c: 12,
            d: "xx",
            e: 34,
            f: "yy",
            g: false,
            h: -1234,
        };
    }
}