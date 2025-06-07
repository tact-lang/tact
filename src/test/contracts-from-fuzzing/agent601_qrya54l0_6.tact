struct A {
    a: Int;
}

struct B {
    b: String;
}

struct C {
    c: Bool;
}

struct Combo {
    f1: A;
    f2: B;
    f3: C;
}

contract Test {
    data: Combo;

    init() {
        self.data = Combo{
            f1: A{ a: 1 },
            f2: B{ b: "text" },
            f3: C{ c: true },
        };
    }
}
