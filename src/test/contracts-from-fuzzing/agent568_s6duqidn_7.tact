struct A {
    f1: Int;
}

struct B {
    f2: Int;
    a: A;
}

struct C {
    f3: Int;
    b: B;
}

contract DeepChain {
    deep: C;

    init() {
        self.deep = C{
            f3: 3,
            b: B{
                f2: 2,
                a: A{f1:1}
            }
        };
    }
}