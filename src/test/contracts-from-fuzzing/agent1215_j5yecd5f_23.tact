struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    optA: A?;
}

struct C {
    b: B;
    optB: B?;
}

contract DeepChain(
    cfield: C,
    optC: C?,
) {}