struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    val: Int;
}

contract RecNest {
    s: RecA;

    init() {
        self.s = RecA{ b: RecB{ c: RecC{ val: 42 } } };
    }
}