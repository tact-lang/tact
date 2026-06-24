struct A {
    value: Int;
}

struct B {
    nested: A;
}

struct C {
    nested: B;
}

struct D {
    nested: C;
}

contract DeeplyNested {
    data: D;

    init() {
        self.data = D{
            nested: C{
                nested: B{
                    nested: A{
                        value: 42
                    }
                }
            }
        };
    }
}