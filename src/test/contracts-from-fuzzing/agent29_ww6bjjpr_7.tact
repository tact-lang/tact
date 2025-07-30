struct DeepNest {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Bool?;
    f: Int;
    g: String?;
    h: Bool;
    i: Bool?;
    j: Int?;
}

contract Test {
    stuff: DeepNest;

    init() {
        self.stuff = DeepNest{
            a: 1, b: null, c: true, d: "ok", e: false, f: 42, g: null, h: false, i: true, j: null
        };
    }
}