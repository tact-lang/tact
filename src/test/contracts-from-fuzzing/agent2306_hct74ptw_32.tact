struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
}

contract OptS2 {
    s: S2?;

    init() {
        self.s = null;
    }
}
