struct A { x: Int; y: Int; }
struct B { a: A; z: Int; }
struct C { b: B; f: Bool; }

contract NestedComplex {
    store: C;

    init() {
        self.store = C{
            b: B{ a: A{ x: 1, y:2 }, z:3 },
            f: true
        };
    }
}
