struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract DefaultDeep {
    d: C = C{ z: B{ y: A{ x:123 } } };
}