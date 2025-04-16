struct A {
    a1: Int;
}

struct B {
    b1: A;
    b2: Bool?;
}

struct C {
    c1: B;
    c2: String;
}

contract TestNestedOptional {
    data: C;

    init() {
        self.data = C{
            c1: B{
                b1: A{
                    a1: 1
                },
                b2: true
            },
            c2: "hello"
        };
    }
}
