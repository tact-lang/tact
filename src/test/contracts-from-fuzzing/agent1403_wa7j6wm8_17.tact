struct A {
    int1: Int;
    bool1: Bool;
}

struct B {
    s: String;
    inner: A;
}

struct C {
    int2: Int;
    inner_b: B;
}

contract DenseNesting {
    data: C;
    init() {
        self.data = C{
            int2: 2,
            inner_b: B{
                s: "s",
                inner: A{
                    int1: 5,
                    bool1: false,
                }
            }
        };
    }
}