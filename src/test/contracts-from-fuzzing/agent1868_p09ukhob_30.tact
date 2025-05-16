struct A {
    v1: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
    msg: String;
}

contract FourStructNest {
    d: D = D{
        c: C{ b: B{ a: A{ v1: 5 } } },
        msg: "hi"
    };

    init() {}
}