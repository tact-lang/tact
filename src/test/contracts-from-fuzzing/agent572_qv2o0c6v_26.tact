struct A { x: Int }
struct B { y: A }
struct C { z: B }

contract NestedMultiLevel {
    val: C;
    init() {
        self.val = C { z: B { y: A { x: 1234 } } };
    }
}