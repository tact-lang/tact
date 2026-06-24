struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

struct Container {
    a1: A;
    b1: B;
    c1: C;
}

contract Test11 {
    field: Container;

    init() {
        self.field = Container{
            a1: A{ a: 1 },
            b1: B{ b: false },
            c1: C{ c: "xyz" }
        };
    }
}