struct A { a: Int; }
struct B { b: Int; }
struct C { a: A; b: B; opt: B?; }

contract Test {
    f: C?;

    init() {
        self.f = C{
            a: A{a:1},
            b: B{b:2},
            opt: null
        };
    }
}