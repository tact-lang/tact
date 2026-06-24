struct A {
    foo: Int;
}

struct B {
    a: A;
    bar: Bool;
}

struct C {
    b: B;
    baz: String;
}

contract TestContract {
    data: C = C{
        b: B{
            a: A{ foo: 0 },
            bar: false
        },
        baz: "hello"
    };
}