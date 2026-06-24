struct ManyFields {
    i1: Int;
    b1: Bool;
    i2: Int;
    b2: Bool;
    s1: String;
    c1: Cell;
    s2: String;
    c2: Cell;
    s3: String;
    b3: Bool;
}

contract TestStorage {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            i1: 1,
            b1: true,
            i2: 2,
            b2: false,
            s1: "a",
            c1: emptyCell(),
            s2: "b",
            c2: emptyCell(),
            s3: "c",
            b3: true
        };
    }
}