struct A {
    x: Int?
}

struct B {
    y: A?
}

contract OptionalNestTest {
    b: B = B{ y: null };
}