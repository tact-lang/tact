struct S {
    x: Int;
}

contract AssignStructFields {
    s: S;

    init() {
        self.s = S{ x: 0 };
        self.s.x = 5;
    }
}