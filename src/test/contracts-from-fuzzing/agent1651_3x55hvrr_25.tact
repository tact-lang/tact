struct Mixed {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract Test25 {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "test",
            f: null
        };
    }
}
