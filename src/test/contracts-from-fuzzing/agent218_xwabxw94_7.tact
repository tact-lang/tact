struct TupleLike {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Int;
    x5: Bool;
    x6: String;
}

contract TupleField {
    t: TupleLike;

    init() {
        self.t = TupleLike{ x1: 1, x2: true, x3: "a", x4: 2, x5: false, x6: "b" };
    }
}