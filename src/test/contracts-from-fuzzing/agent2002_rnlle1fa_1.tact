struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int as uint32;
    d: String;
    e: Bool;
    f: Int as int16;
    g: String;
    h: Bool;
    i: Int;
    j: String;
}

contract Test {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            a: 1,
            b: true,
            c: 42,
            d: "hello",
            e: false,
            f: -10,
            g: "world",
            h: true,
            i: 9999,
            j: "!",
        };
    }
}
