struct A { x: Int; }
struct B { a: A; b: Int; }

contract NestedMany {
    x: B;
    y: B;
    z: B;

    init() {
        self.x = B{ a: A{ x: 1 }, b: 2 };
        self.y = B{ a: A{ x: 3 }, b: 4 };
        self.z = B{ a: A{ x: 5 }, b: 6 };
    }
}
