struct Inner {
    a: Int;
    b: Bool;
    c: Cell;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{a: 1, b: true, c: emptyCell()};
    }
}