struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    val: Int;
}

contract Recursive {
    r: RecA;
    init() {
        self.r = RecA{ b: RecB{ c: RecC{ val: 99 }}};
    }
}