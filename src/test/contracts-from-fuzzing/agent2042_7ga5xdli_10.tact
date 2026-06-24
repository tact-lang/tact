struct A {
    a: Int;
}

struct B {
    b: Int;
    next: A;
}

struct C {
    first: A;
    second: B;
}

contract ReorderedNested {
    data: C;
    init() {
        self.data = C{
            first: A{ a: 11 },
            second: B{ b: 22, next: A{ a: 33 } }
        };
    }
}