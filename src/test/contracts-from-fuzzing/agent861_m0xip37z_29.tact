struct S {
    one: Int;
    two: Int;
}

contract SameStructTwice {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{ one: 1, two: 2 };
        self.s2 = S{ one: 3, two: 4 };
    }
}
