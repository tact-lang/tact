struct ManyFields {
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
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1, b: true, c: null, d: null, e: 2, f: false,
            g: null, h: null, i: 3, j: true
        };
    }
}