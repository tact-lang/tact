struct C {
    x: Int = 1;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract NestedOptionalsMidPresent {
    a: A = A{ b: B{ c: null } };
}