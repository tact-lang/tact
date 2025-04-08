struct TinyFields {
    a: Int as uint3;
    b: Int as uint3;
    c: Int as uint3;
    d: Int as uint3;
    e: Int as uint3;
    f: Int as uint3;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
}

contract TinyStore {
    data: TinyFields;

    init() {
        self.data = TinyFields {
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6,
            g: true, h: false, i: true, j: false,
        };
    }
}