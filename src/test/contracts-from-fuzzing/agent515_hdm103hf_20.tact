struct ManyPrimitives {
    b: Bool;
    i: Int;
    s: String;
}

contract TestPrimFields {
    p1: ManyPrimitives;
    p2: ManyPrimitives;

    init() {
        self.p1 = ManyPrimitives{b: true, i: 1, s: "one"};
        self.p2 = ManyPrimitives{b: false, i: 2, s: "two"};
    }
}
