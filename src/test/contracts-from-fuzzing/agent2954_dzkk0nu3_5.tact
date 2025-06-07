struct A {
    a1: Int;
    a2: String;
}

struct B {
    b1: Bool;
    a: A;
}

struct C {
    c1: Slice;
    c2: B;
}

contract MultiNestedStructTest {
    stuff: C;

    init() {
        self.stuff = C{
            c1: emptyCell().asSlice(),
            c2: B{ b1: true, a: A{ a1: 7, a2: "xyz" } }
        };
    }
}
