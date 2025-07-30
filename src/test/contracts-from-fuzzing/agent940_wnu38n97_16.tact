struct A {
    f1: Int;
    f2: Int;
}

struct B {
    s1: A;
    s2: A;
}

contract TestContract {
    data: B;

    init() {
        self.data = B{
            s1: A{ f1: 1, f2: 2 },
            s2: A{ f1: 3, f2: 4 }
        };
    }
}