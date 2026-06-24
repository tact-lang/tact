struct A {
    ai: Int;
}

struct B {
    bi: Int;
    ba: A;
}

struct C {
    ca: A;
    cb: B;
    opt_a: A?;
}

contract NestedOptionals {
    val: C;

    init() {
        self.val = C{
            ca: A{ ai: 1 },
            cb: B{ bi: 2, ba: A{ ai: 3 } },
            opt_a: null
        };
    }
}