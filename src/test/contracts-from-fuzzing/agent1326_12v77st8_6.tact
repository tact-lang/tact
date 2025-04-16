struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

struct C {
    b: B;
    z: Int;
}

contract LongChain {
    root: C;
    init() {
        self.root = C{
            b: B{
                a: A{ x: 5 },
                y: 6
            },
            z: 7
        };
    }
}