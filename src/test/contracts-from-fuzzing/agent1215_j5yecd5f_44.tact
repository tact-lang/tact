struct A {
    x: Int?;
}
struct B {
    y: Int;
}
struct C {
    a: A?;
    b: B?;
}

contract OptionalMix(
    param: C?,
) {}