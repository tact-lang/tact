struct LongStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
}

contract ManyFields {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            a: 1, b: true, c: 2, d: false, e: 3,
            f: true, g: 4, h: false, i: 5, j: true
        };
    }
}