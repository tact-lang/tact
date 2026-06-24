struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Bool;
    h: Int;
    i: String?;
    j: Bool;
}

contract LargeFieldsContract {
    data: LargeStruct;
    
    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: "def",
            g: false,
            h: 42,
            i: "ghi",
            j: true,
        };
    }
}