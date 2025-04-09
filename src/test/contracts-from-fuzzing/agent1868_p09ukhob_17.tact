struct A {
    foo: Int;
}

struct B {
    a: A;
    bar: Bool;
}

contract MixedTuple {
    b: B = B{
        a: A{ foo: 5 },
        bar: true,
    };

    init() {}
}