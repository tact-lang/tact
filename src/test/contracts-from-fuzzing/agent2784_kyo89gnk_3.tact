struct A { x: Int; }
struct B { y: Int; z: A; }
struct C { b: B; w: Bool; }

contract Deep {
    val: C;

    init() {
        self.val = C{
            b: B{ y: 3, z: A{ x: 5 } },
            w: true
        };
    }
}