struct A {
    f1: Int?;
    f2: B;
}

struct B {
    f3: Int;
    f4: C?;
}

struct C {
    f5: Int;
}

contract TestContract {
    nested: A;

    init() {
        self.nested = A{
            f1: null,
            f2: B{
                f3: 1,
                f4: C{f5: 2}
            }
        };
    }
}