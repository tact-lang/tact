struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepChain {
    val: C = C{ b: B{ a: A{ x: 100 } } };
}