struct A {
    foo: Int;
}

struct B {
    optA: A?;
}

contract Test {
    nested: B = B{};
}