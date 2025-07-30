struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

struct Complex {
    a: A;
    b: B;
    c: C;
}

contract MultiStructNest {
    data: Complex;

    init() {
        self.data = Complex{
            a: A{ a: 1 },
            b: B{ b: true },
            c: C{ c: "str" }
        };
    }
}