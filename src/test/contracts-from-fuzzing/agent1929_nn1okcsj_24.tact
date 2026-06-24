struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    i: Int;
}

contract Recursion {
    state: RecA;
    init() {
        self.state = RecA{ b: RecB{ c: RecC{ i: 7 } } };
    }
}