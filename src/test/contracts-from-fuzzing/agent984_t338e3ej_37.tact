struct A {
    a: Int;
}

struct B {
    b: Int;
    a: A;
}

struct C {
    a: A;
    b: B;
}

contract RepeatNested {
    c: C = C{
        a: A{a:1},
        b: B{b:2,a:A{a:3}}
    };
}