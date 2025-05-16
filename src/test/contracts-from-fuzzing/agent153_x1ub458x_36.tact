struct A { x: Int; }
struct B { y: Int; }
struct ComboAB {
    a: A;
    b: B;
}

contract AssignMultipleInner {
    f: ComboAB;

    init() {
        self.f = ComboAB{ a:A{x:1}, b:B{y:2} };
        self.f.a.x = 123;
        self.f.b.y = 456;
    }
}