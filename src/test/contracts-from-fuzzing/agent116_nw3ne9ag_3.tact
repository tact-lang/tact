contract DeepOptionalNested {
    foo: A;

    init() {
        self.foo = A{
            b: B{
                c: null,
                aVal: 10
            },
            x: 1
        };
    }
}

struct A {
    b: B;
    x: Int;
}

struct B {
    c: C?;
    aVal: Int;
}

struct C {
    z: Int;
}
