struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Big {
    a: A;
    b: B;
    c: C;
}

contract BigNested {
    x: Big;

    init() {
        self.x = Big{ a:A{a:1}, b:B{b:2}, c:C{c:3} };
    }
}