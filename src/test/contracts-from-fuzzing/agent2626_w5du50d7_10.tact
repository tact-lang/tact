struct A {
    f: Int = 1;
}

struct B {
    g: A;
}

struct C {
    h: B;
}

contract DeepChain {
    z: C;

    init() {
        self.z = C{
            h: B{
                g: A{f: 55}
            }
        };
    }
}