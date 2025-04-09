struct A {
    value: Int;
}

struct B {
    value: Int;
    nested: A;
}

struct C {
    nestedB: B;
}

contract ChainNested {
    data: C;

    init() {
        self.data = C{
            nestedB: B{
                value: 7,
                nested: A{
                    value: 3
                }
            }
        };
    }
}