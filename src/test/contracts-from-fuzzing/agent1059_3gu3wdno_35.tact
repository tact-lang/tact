struct LastRemain {
    a: Int;
    tail: Cell as remaining;
}

contract RemainLast {
    f: LastRemain;
    init() {
        self.f = LastRemain{ a:1, tail: emptyCell() };
    }
}