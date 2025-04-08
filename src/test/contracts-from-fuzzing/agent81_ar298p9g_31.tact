struct S { x: Int; y: Int; }

contract AssignTwice {
    s: S;

    init() {
        self.s = S{ x: 1, y: 2 };
        self.s = S{ x: 3, y: 4 };
    }
}