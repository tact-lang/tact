struct S {
    x: Int;
    y: Int;
}

contract StructSum {
    s: S;
    total: Int;

    init() {
        self.s = S{ x: 3, y: 4 };
        self.total = self.s.x + self.s.y;
    }
}
