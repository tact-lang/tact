struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: A;
    b2: A;
    b3: A;
    b4: A;
    b5: A;
}

contract Test {
    store: B;

    init() {
        self.store = B{
            b1: A{a1:1,a2:true},
            b2: A{a1:2,a2:false},
            b3: A{a1:3,a2:true},
            b4: A{a1:4,a2:false},
            b5: A{a1:5,a2:true}
        };
    }
}