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
    val: Int?;
}

contract TestContract {
    x: A;

    init() {
        self.x = A{ b: null };
    }

    receive() {}
}