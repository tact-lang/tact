struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }

contract TestContract {
    sa: A;
    sb: B;
    sc: C;

    init() {
        self.sa = A{ x:1 };
        self.sb = B{ y:true };
        self.sc = C{ z:"wow" };
    }
}