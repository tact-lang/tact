struct A { x: Int; y: Bool; }
struct B { a1: A; a2: A; }
struct C { b1: B; b2: B; extra: Int; }

contract WideNestedStore {
    big: C;

    init() {
        self.big = C{
            b1: B{ a1: A{ x:1, y:true }, a2: A{ x:2, y:false } },
            b2: B{ a1: A{ x:3, y:false }, a2: A{ x:4, y:true } },
            extra: 123,
        };
    }
}