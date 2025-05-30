struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: String;
    b2: Int?;
}

struct C {
    c1: Bool;
    c2: Int;
}

contract ManyStructFields {
    sa: A;
    sb: B;
    sc: C;

    init() {
        self.sa = A { a1:1, a2:true };
        self.sb = B { b1:"foo", b2:null };
        self.sc = C { c1:false, c2:42 };
    }
}