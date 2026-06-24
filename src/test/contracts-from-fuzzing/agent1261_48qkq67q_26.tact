struct Longer {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract LongStructs {
    x: Longer;

    init() {
        self.x = Longer{
            a: 1, b: true, c: "1", d: null, e: null, f: null,
            g: 2, h: false, i: "2", j: null, k: null, l: null
        };
    }
}