struct LargerStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: String;
    i: Bool;
}

contract UseLargerStruct {
    big: LargerStruct;

    init() {
        self.big = LargerStruct{
            a: 1,
            b: true,
            c: "test",
            d: null,
            e: false,
            f: "hello",
            g: 2,
            h: "world",
            i: true,
        };
    }
}