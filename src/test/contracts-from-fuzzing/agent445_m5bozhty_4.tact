struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: A;
    b2: A;
}

struct C {
    c1: B;
    c2: B;
}

contract ThreeLayers {
    val: C;
    init() {
        self.val = C{
            c1: B{b1: A{a1:1,a2:true}, b2: A{a1:2,a2:false}},
            c2: B{b1: A{a1:3,a2:true}, b2: A{a1:4,a2:false}}
        };
    }
}