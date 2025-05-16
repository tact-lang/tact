struct A {
    v: Int;
}

struct B {
    s: A?;
}

struct C {
    b: B?;
}

contract ChainOpt {
    c: C?;

    init() {
        self.c = null;
    }
}
