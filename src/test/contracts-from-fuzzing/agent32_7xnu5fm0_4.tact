struct ManyPrims {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
}

contract TestContract {
    mp: ManyPrims;

    init() {
        self.mp = ManyPrims{
            i1: 1,
            i2: 2,
            b1: true,
            b2: false,
            s1: "foo",
            s2: "bar"
        };
    }
}