struct A { x: Int }
struct B { y: A }
struct C { z: B }
struct D { w: C }
struct E { q: D }

contract NestFive {
    e: E;
    init() {
        self.e = E{ q: D{ w: C{ z: B{ y: A{ x: 42 } } } } };
    }
}
