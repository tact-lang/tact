struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract Test16 {
    v: Mixed;

    init() {
        self.v = Mixed{
            a: 10,
            b: null,
            c: "hello",
            d: null,
            e: true,
            f: null,
        };
    }
}