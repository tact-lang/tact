struct A {
    foo: Int;
}

struct B {
    bar: Int;
    a: A;
}

struct C {
    baz: Int;
    b: B;
    txt: String;
}

contract ManyMix {
    data: C;

    init() {
        self.data = C{
            baz: 1,
            b: B{
                bar: 2,
                a: A{
                    foo: 3,
                },
            },
            txt: "hi",
        };
    }
}