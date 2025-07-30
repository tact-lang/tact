struct Large {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool?;
}

contract TestContract {
    hugeField: Large;

    init() {
        self.hugeField = Large{
            a: 1, b: 2, c: 3, d: true, e: false, f: true, g: null, h: null, i: 9, j: true, k: null, l: false
        };
    }
}
