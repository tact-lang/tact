struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int as uint32;
    f: Int as int64;
    g: Bool;
    h: Int?;
    i: Bool?;
    j: Int;
}

contract ManyFieldsContract {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 42,
            f: -64,
            g: false,
            h: 100,
            i: null,
            j: 999
        };
    }
}