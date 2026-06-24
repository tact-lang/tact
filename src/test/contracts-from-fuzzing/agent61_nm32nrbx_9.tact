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

contract TestContract {
    cData: C;

    init() {
        self.cData = C{
            z: 5,
            b: B{
                y: 10,
                a: A{ x: 15 }
            }
        };
    }
}