struct A {
    x: Int;
}

struct B {
    a: A;
}

contract TestNested {
    b: B = B{ a: A{ x: 42 } };
}