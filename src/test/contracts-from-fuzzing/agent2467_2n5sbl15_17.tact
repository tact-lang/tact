struct A { f: Int; }
struct B { f: Int; }
struct C { f: Int; }
struct D { f: Int; }

struct Complex {
    a: A;
    b: B;
    c: C;
    d: D;
}

contract BigNested {
    comp: Complex;
    init() {
        self.comp = Complex{
            a: A{f:1}, b: B{f:2}, c: C{f:3}, d: D{f:4}
        };
    }
}