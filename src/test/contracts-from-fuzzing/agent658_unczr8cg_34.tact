struct S {
    n: Int;
}

contract InitStructDirect {
    s: S;

    init() {
        self.s = S{n:123};
    }
}