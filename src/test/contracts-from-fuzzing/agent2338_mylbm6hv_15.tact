struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    value: Int;
}

contract RecursionTest {
    top: RecA;

    init() {
        self.top = RecA{ b: RecB{ c: RecC{ value: 77 } } };
    }
}