struct A {
    a: Int;
}

contract TestContract {
    f1: A;
    f2: A?;

    init() {
        self.f1 = A{ a: 1 };
        self.f2 = null;
    }
}