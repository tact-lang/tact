struct C {
    z: Int;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract MultiOptNull {
    a: A?;
}