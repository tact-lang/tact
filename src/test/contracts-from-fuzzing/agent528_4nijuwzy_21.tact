struct A { s: String; }
struct B { inner: A?; flag: Bool; }

contract OptNestedStructParam(
    b: B?,
) {}
