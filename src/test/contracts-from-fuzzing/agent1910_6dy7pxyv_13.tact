struct A {
    x: Int;
}

struct B {
    y: Int;
    nested: A;
}

struct C {
    z: Int;
    nested: B;
}

contract DeepChain {
    val: C;

    init() {
        self.val = C{
            z: 30,
            nested: B{
                y: 20,
                nested: A{
                    x: 10
                }
            }
        };
    }
}
