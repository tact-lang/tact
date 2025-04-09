struct S {
    f1: Int;
}

contract OverwriteDefaultTest {
    s: S = S{ f1:5 };

    init() {
        self.s = S{ f1:42 };
    }
}