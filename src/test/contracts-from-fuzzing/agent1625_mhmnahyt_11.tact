struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    d: D?;
}

struct D {
    val: Int;
}

contract ChainNulls {
    top: A;

    init() {
        self.top = A{
            b: null,
        };
    }
}
