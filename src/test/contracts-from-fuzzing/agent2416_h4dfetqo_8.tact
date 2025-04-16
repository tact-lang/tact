struct A {
    a: Int = 1;
}

struct B {
    b: Int = 2;
}

struct C {
    c: Int = 3;
}

struct Combine {
    a: A;
    b: B;
    c: C;
}

contract MultiStructCombine {
    val: Combine = Combine{
        a: A{},
        b: B{},
        c: C{}
    };
}