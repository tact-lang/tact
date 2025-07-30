struct BigStruct {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int? as uint8;
    f: Int? as int64;
    g: Bool;
    h: Bool;
    i: Bool?;
    j: String;
    k: String?;
    l: Int;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: -5,
            b: 65535,
            c: -123456,
            d: 12345678901234,
            e: 42,
            f: -9876543210,
            g: true,
            h: false,
            i: true,
            j: "hello",
            k: "optional",
            l: 987654321,
        };
    }
}
