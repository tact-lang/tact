struct A {
    f1: Int;
    f2: Int?;
}

struct B {
    f3: A;
    f4: A?;
}

contract DeepOptionals {
    d: B;

    init() {
        self.d = B {
            f3: A { f1: 1, f2: null },
            f4: null
        };
    }
}