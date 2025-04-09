struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract Test {
    state: Mixed;

    init() {
        self.state = Mixed{
            a: 1,
            b: null,
            c: "x",
            d: 2,
            e: true,
            f: "y",
        };
    }
}