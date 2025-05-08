struct Bigger {
    i1: Int;
    i2: Int;
    s: String;
    b: Bool;
    opt: Int?;
}

contract WideTest {
    flds: Bigger;

    init() {
        self.flds = Bigger{
            i1: 1,
            i2: 2,
            s: "x",
            b: false,
            opt: null,
        };
    }
}