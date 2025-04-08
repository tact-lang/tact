struct S1 {
    f1: Int?;
    f2: Bool;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

contract OptComposite {
    ps: S2?;

    init() {
        self.ps = null;
    }
}