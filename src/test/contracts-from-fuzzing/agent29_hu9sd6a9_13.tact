struct A { x: Int }
struct B { y: A }
struct C { z: B }
contract NestedStructs {
    data: C;
    init() {
        self.data = C{ z: B{ y: A{ x: 42 } } };
    }
}