struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: Int;
    b2: String;
}

struct C {
    c1: Bool;
    c2: String;
}

contract ManyStructFields {
    sa: A;
    sb: B;
    sc: C;

    init() {
        self.sa = A{ a1:1, a2:true };
        self.sb = B{ b1:2, b2:"b" };
        self.sc = C{ c1:false, c2:"c" };
    }
}