struct TupleTest {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Cell;
}

contract TupleVars {
    tup: TupleTest;

    init() {
        self.tup = TupleTest{a: 1, b: 2, c: true, d: "hi", e: emptyCell()};
    }
}
