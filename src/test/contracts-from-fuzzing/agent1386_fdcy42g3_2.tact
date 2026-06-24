struct A { x: Int; }
struct B { a: A; }

contract DeepNest {
    field: B;
    init() { self.field = B{ a: A{ x: 1 } }; }
}