struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

struct C {
    b: B;
    z: Bool;
}

contract ChainTest {
    data: C = C{b: B{a: A{x: 5}, y: 6}, z: true};
}
