struct S {
    f: Builder;
}

contract TestC {
    s: S;

    init() {
        self.s = S{ f: beginCell() };
    }
}