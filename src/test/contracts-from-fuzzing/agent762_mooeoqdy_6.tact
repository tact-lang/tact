struct A { x: Int }
struct B { y: Int; a: A }
struct C { z: Int; b: B }

contract TestContract {
    stateA: A;
    stateB: B;
    stateC: C;

    init() {
        self.stateA = A{x:1};
        self.stateB = B{y:2, a:A{x:3}};
        self.stateC = C{z:4, b:B{y:5, a:A{x:6}}};
    }

    receive() {
        self.stateA = self.stateA;
        self.stateB = self.stateB;
        self.stateC = self.stateC;
    }
}