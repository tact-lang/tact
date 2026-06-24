struct LargeStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
    g: Int;
    h: String?;
    i: Bool;
    j: Int?;
}

contract TestContract {
    info: LargeStruct;
    
    init() {
        self.info = LargeStruct{
            a: 1,
            b: "hello",
            c: false,
            d: null,
            e: "world",
            f: true,
            g: 42,
            h: null,
            i: true,
            j: 123
        };
    }
}