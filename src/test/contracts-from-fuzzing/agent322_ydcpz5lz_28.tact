struct A {
    inner1: Int;
    inner2: Bool;
}

struct B {
    nested: A;
}

contract Test(b: B) {}