struct A {
    x: Int;
}

struct B {
    c: Int;
    a: A;
}

struct C {
    b: B;
}

contract X {
    val: C = C{ b: B{ c:42, a: A{ x:1 } } };
}
