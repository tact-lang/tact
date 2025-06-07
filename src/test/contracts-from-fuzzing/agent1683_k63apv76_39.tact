struct A {
    b: B;
}

struct B {
    c: C;
    d: D;
}

struct C {
    x: Int;
}

struct D {
    y: Int;
}

contract TestContract {
    val: A = A{
        b: B{
            c: C{ x: 1 },
            d: D{ y: 2 }
        }
    };
}