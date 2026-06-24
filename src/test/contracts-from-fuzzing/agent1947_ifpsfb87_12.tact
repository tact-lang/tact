struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
}

contract DeepChain {
    c: C;
    init() {
        self.c = C{
            z: 1,
            b: B{
                y: 2,
                a: A{
                    x: 3,
                },
            },
        };
    }
}