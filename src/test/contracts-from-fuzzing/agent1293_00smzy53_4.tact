struct A {
    value: Int;
}

struct B {
    inner: A;
    flag: Bool;
}

contract Test {
    nested: B = B{ inner: A{ value: 5 }, flag: false };
}