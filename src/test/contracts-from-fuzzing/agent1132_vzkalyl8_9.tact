struct BigData {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
}

contract ComplexInit {
    record: BigData;

    init() {
        self.record = BigData{
            a: 1, b: true, c: "x", d: 7, e: null,
            f: "y", g: 42, h: false, i: "z"
        };
    }
}