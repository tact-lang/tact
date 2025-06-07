struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: A;
    b2: String;
}

struct C {
    c1: B;
    c2: Int;
}

contract DeepNesting {
    value: C;
    
    init() {
        self.value = C{
            c1: B{
                b1: A{
                    a1: 42,
                    a2: false,
                },
                b2: "hello",
            },
            c2: 7,
        };
    }
}
