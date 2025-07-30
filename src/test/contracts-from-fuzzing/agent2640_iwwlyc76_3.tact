struct Large {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool?;
}

contract TestContract {
    largeField: Large;

    init() {
        self.largeField = Large{
            a: 1, b: true, c: 2, d: false, e: 3, f: true, g: 4, h: false,
            i: 5, j: true, k: 6, l: true
        };
    }
}
