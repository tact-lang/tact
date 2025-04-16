// Nested optional struct in persistent storage, non-null inner
struct A {
    x: Int;
}
struct B {
    a: A?;
}
contract TestContract {
    b: B = B{ a: A{ x: 1 } };
}