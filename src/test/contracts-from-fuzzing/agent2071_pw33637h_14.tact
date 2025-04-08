struct A {
    i: Int;
}

struct B {
    s: String;
}

contract Alternated {
    f1: A;
    f2: B;
    f3: A;
    f4: B;

    init() {
        self.f1 = A{ i: 10 };
        self.f2 = B{ s: "x" };
        self.f3 = A{ i: 20 };
        self.f4 = B{ s: "y" };
    }
}