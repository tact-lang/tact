struct S {
    f: Int;
}

contract TestContract {
    inner1: S;
    inner2: S;

    init() {
        self.inner1 = S{ f: 10 };
        self.inner2 = S{ f: 20 };
    }
}