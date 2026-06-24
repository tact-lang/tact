message(2) M {
    foo: Int;
}

struct S {
    mm: M? = null;
    count: Int;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{ count: 42 };
    }
}