struct A { foo: Int; }
struct B { bar: Int; }
struct C { baz: Int; }

struct Combo {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: A{ foo: 1 },
            b: B{ bar: 2 },
            c: C{ baz: 3 },
        };
    }
}
