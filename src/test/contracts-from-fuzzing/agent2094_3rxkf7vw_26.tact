struct D {
    val: Int = 42;
}

struct C {
    subD: D?;
}

struct B {
    subC: C = C{ subD: null };
}

struct A {
    subB: B;
}

contract DeepMix {
    data: A = A{ subB: B{} };
    receive() {}
}
