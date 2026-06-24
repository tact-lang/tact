struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: Int;
    b2: A;
}

struct C {
    c1: B;
    c2: A;
}

contract MultipleNestedFields {
    value: C;

    init() {
        self.value = C{
            c1: B{
                b1: 5,
                b2: A{
                    a1: 1,
                    a2: true
                }
            },
            c2: A{
                a1: 2,
                a2: false
            }
        };
    }
}
