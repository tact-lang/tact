struct Wide {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
    i: Int?;
    j: Bool?;
}

contract WideStructTest {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: "hello",
            f: null,
            g: 2,
            h: true,
            i: 3,
            j: false
        };
    }
}