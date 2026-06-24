struct A {
    i: Int?;
}

struct B {
    a1: A;
    a2: A;
}

contract StructOptRepeat {
    f: B;

    init() {
        self.f = B{ a1: A{ i: null }, a2: A{ i: 1 } };
    }
}