struct A {
    x: Int;
}

struct B {
    a1: A;
    a2: A;
}

contract DuplicateNested {
    field: B = B{ a1: A{ x: 1 }, a2: A{ x: 2 } };
}