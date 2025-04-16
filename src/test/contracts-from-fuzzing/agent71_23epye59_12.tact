struct A {
    f: Int;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

struct D {
    c: C?;
}

contract ChainOptionals {
    data: D;

    init() {
        self.data = D{
            c: C{ b: B{ a: A{ f: 5 } } }
        };
    }
}