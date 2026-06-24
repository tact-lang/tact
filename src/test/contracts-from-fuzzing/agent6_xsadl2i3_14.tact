struct A {
    v1: Int;
}

struct B {
    a: A;
    o: Int?;
}

struct C {
    b: B;
    s: String?;
}

contract DeepChain {
    data: C;
    init() {
        self.data = C{
            b: B{
                a: A{
                    v1: 7,
                },
                o: null,
            },
            s: null,
        };
    }
}