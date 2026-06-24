struct A { x: Int }
struct B { y: Int }
struct C { z: Int }

contract MultiStruct {
    sa: A;
    sb: B;
    sc: C;

    init() {
        self.sa = A{x:1};
        self.sb = B{y:2};
        self.sc = C{z:3};
    }
}
