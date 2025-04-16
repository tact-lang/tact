struct RecursiveInner {
    r: RecursiveOuter;
}

struct RecursiveOuter {
    i: Int;
    // forbidden: no recursive or mutual structs
    // inner: RecursiveInner;
}

contract MutualStructTest {
    rec: RecursiveOuter;

    init() {
        self.rec = RecursiveOuter{ i: 1 };
    }
}