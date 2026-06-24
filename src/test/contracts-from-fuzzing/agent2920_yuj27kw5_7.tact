struct A {
    a1: Int;
}

struct B {
    b1: Int;
    innerA: A;
}

struct C {
    c1: Int;
    innerB: B;
}

contract MultiLayerStruct {
    layer: C;

    init() {
        self.layer = C{
            c1: 1,
            innerB: B{
                b1: 2,
                innerA: A{ a1: 3 }
            }
        };
    }
}