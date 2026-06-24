struct A {
    a: Int;
    b: Bool?;
}

struct B {
    c: A;
    d: Int?;
}

struct C {
    e: B;
    f: String?;
}

contract NestedMixOptionals {
    data: C;

    init() {
        self.data = C{
            e: B{ c: A{ a: 1, b: null }, d: null },
            f: null
        };
    }
}