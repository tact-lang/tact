struct S {
    a: Int;
    b: Bool;
    c: Cell;
}

contract ArrayOfStructs {
    s0: S;
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        self.s0 = S{ a: 1, b: true, c: emptyCell() };
        self.s1 = S{ a: 2, b: false, c: emptyCell() };
        self.s2 = S{ a: 3, b: true, c: emptyCell() };
        self.s3 = S{ a: 4, b: false, c: emptyCell() };
        self.s4 = S{ a: 5, b: true, c: emptyCell() };
    }
}