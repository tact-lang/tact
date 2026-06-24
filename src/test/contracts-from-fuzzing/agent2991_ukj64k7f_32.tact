struct A { x: Int; y: Int }

struct B { s: A; z: Int }

contract Test {
    nested: B;

    init() {
        self.nested = B{
            s: A{ x: 5, y: 6 },
            z: 7
        };
    }
}