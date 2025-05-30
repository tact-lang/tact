struct A {
    x: Int?;
}

struct B {
    a: A;
}

contract TestNestOpt {
    b: B = B{ a: A{ x: null } };
}