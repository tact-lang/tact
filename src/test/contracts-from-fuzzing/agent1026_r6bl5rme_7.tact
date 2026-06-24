struct A {
    x: Int;
    y: Int;
}

struct B {
    a1: A;
    a2: A;
}

contract DoubleStruct {
    storage: B;

    init() {
        self.storage = B{
            a1: A{ x:1,y:2 },
            a2: A{ x:3,y:4 },
        };
    }
}