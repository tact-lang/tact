struct LargeData {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract LargeFields {
    big: LargeData;
    
    init() {
        self.big = LargeData {
            a: 1,
            b: false,
            c: "test",
            d: null,
            e: null,
            f: "hello",
            g: 7,
            h: "more",
            i: true,
            j: 42,
        };
    }
}