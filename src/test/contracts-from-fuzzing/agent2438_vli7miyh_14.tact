struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

contract OptOptOptional {
    opt: S2?;

    init() {
        self.opt = null;
    }
}
