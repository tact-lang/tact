struct A { x: Int }
struct B { y: Int }
struct C { z: Int }

contract ManyStructs2 {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A{x:1};
        self.f2 = B{y:2};
        self.f3 = C{z:3};
    }
}