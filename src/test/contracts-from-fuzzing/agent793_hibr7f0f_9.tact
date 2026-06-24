struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract DeepStructs {
    state: C;
    init() {
        self.state = C{
            c: B{
                b: A{
                    a: 99,
                },
            },
        };
    }
}