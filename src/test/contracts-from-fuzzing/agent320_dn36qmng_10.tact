struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Int;
}

contract Test {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 1,
            b: null,
            c: "hi",
            d: 5,
            e: true,
            f: null,
            g: 9,
        };
    }
}