struct A {
    x: Int;
}

struct B {
    optA: A?;
}

contract Test {
    nested: B = B{ optA: A{ x: 42 } };
}