struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    z: Int;
}

contract ManyOptionalStructs(
    val1: A?,
    val2: B?,
    val3: C?,
    counter: Int,
) {
}