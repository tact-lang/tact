struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract NestedFields {
    rec: C;

    init() {
        self.rec = C{z: B{ y: A{ x: 777 } }};
    }
}
