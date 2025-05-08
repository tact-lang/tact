struct A { x: Int; }
struct B { a: A; }

contract InitNested {
    b: B;

    init() {
        self.b = B{ a: A{ x: 100 } };
    }
}