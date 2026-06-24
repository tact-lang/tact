struct A {
    foo: Int;
}

struct B {
    bar: Int;
    nested: A;
}

struct C {
    baz: Bool;
    nestedB: B;
}

contract Test {
    stuff: C;

    init() {
        self.stuff = C{
            baz: true,
            nestedB: B{
                bar: 5,
                nested: A{ foo: 7 }
            }
        };
    }
}
