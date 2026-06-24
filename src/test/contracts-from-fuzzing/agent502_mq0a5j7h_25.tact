struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct WrapABC {
    x: A;
    y: B;
    z: C;
}

contract Bundle {
    q: WrapABC;

    init() {
        self.q = WrapABC{
            x: A{ a: 1 },
            y: B{ b: 2 },
            z: C{ c: 3 },
        };
    }
}