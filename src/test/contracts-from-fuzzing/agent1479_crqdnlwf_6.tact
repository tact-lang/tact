struct RecA {
    z: Int;
}

struct RecB {
    rec: RecA;
}

struct RecC {
    rec: RecB;
}

struct RecD {
    rec: RecC;
}

contract Test {
    data: RecD;
    init() {
        self.data = RecD{ rec: RecC{ rec: RecB{ rec: RecA{ z: 42 } } } };
    }
}