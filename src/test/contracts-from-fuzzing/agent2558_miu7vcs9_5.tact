struct Large {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract BigStructTest {
    st: Large;

    init() {
        self.st = Large{
            a: 1,
            b: "b",
            c: true,
            d: 2,
            e: "e",
            f: false,
            g: 3,
            h: "h",
            i: true,
            j: 4,
        };
    }
}