struct S {
    x: Int;
}

contract AssignDefaultsLater {
    s: S;

    init() {
        self.s = S{ x: 999 };
    }
}