struct A { x: Int }
struct B { y: A }
struct C { z: B }
struct D { w: C }
struct E { v: D }

contract FiveLayers {
    data: E;

    init() {
        self.data = E{ v: D{ w: C{ z: B{ y: A{ x: 123 } } } } };
    }
}
