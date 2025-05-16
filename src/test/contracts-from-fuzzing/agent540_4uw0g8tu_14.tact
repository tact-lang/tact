struct MultiNested {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
    g: Int;
    h: Int?;
    i: Int;
    j: Int?;
}

contract OptionalAlternating {
    st: MultiNested;

    init() {
        self.st = MultiNested{
            a: 1, b: null, c: 2, d: null, e: 3, f: null,
            g: 4, h: null, i: 5, j: null
        };
    }
}