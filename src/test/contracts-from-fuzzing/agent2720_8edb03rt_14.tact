struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

contract Test {
    a: A = A{ x:1 };
    b: B = B{ y:2 };
    c: C = C{ z:3 };
}