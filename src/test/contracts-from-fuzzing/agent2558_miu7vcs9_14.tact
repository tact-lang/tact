struct A { x: Int; }
struct B { y: Int; a: A; }
struct C { b: B; z: Int; }

contract NestedOrder {
    val: C;

    init() {
        self.val = C{
            b: B{
                y: 1,
                a: A{ x: 2 },
            },
            z: 3,
        };
    }
}