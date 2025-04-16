struct A { x: Int; }
struct B { a1: A; a2: A; }

contract ManyNested {
    f1: B;
    f2: B;

    init() {
        self.f1 = B{ a1: A{ x:1 }, a2: A{ x:2 } };
        self.f2 = B{ a1: A{ x:3 }, a2: A{ x:4 } };
    }
}