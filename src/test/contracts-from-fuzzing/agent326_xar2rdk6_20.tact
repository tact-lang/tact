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

contract DeepChain {
    val: C;

    init() {
        self.val = C{
            z: 1,
            nestedB: B{
                y: 2,
                nested: A{
                    x:3
                }
            }
        };
    }

    receive() {
        self.val = self.val;
    }
}