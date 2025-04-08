struct A {
    x: Int = 1;
}

struct B {
    a: A;
    y: Int = 2;
}

struct C {
    b: B;
    z: Int = 3;
}

contract DeepChain {
    c: C;

    init() {
        self.c = C{
            b: B{
                a: A{ x: 11 },
                y: 22
            },
            z: 33
        };
    }
}