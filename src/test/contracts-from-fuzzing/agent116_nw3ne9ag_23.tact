contract DeepOptionChain {
    foo: A;

    init() {
        self.foo = A{
            b: B{
                c: C{
                    d: D{
                        val: 777
                    },
                    x: 3
                },
                y: 2
            },
            z: 1
        };
    }
}

struct A {
    b: B?;
    z: Int;
}

struct B {
    c: C?;
    y: Int;
}

struct C {
    d: D?;
    x: Int;
}

struct D {
    val: Int;
}
