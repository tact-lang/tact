// multiple structs with field order edge-case
struct A { x: Int; y: Int; z: Int; }
struct B { z: Int; y: Int; x: Int; }

contract Test24 {
    a: A;
    b: B;
    init() {
        self.a = A{ x:1,y:2,z:3 };
        self.b = B{ z:3,y:2,x:1 };
    }
}