struct A {
    x: Int;
}

struct B {
    y: Int;
    nested: A;
}

struct C {
    z: Int;
    nestedB: B;
}

contract DeepStructChain {
    data: C;

    init() {
        self.data = C{
            z: 3,
            nestedB: B{
                y: 2,
                nested: A{x: 1}
            }
        };
    }
}