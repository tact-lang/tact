struct A {
    value: Int;
}

struct B {
    innerA: A;
}

struct C {
    innerB: B;
}

contract MultiNested {
    payload: C;

    init() {
        self.payload = C{
            innerB: B{
                innerA: A{
                    value: 123
                }
            }
        };
    }
}
