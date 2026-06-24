struct A { x: Int; y: Bool; }
struct B { b1: A; b2: Int; }
struct C { c1: B; c2: Bool; }

contract Test {
    val: C;

    init() {
        self.val = C{
            c1: B{
                b1: A{ x: 10, y: true },
                b2: 20
            },
            c2: false
        };
    }
}