struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract DeepChain {
    data: C;

    init() {
        self.data = C{
            z: B{
                y: A{ x: 1 }
            }
        };
    }
}