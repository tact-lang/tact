struct A {
    x: Int;
    y: Bool;
}

struct B {
    a1: A;
    a2: A;
    a3: A;
    a4: A;
    a5: A;
    a6: A;
    a7: A;
}

contract TestContract {
    field: B;

    init() {
        self.field = B{
            a1: A{x:1,y:true},
            a2: A{x:2,y:false},
            a3: A{x:3,y:true},
            a4: A{x:4,y:false},
            a5: A{x:5,y:true},
            a6: A{x:6,y:false},
            a7: A{x:7,y:true},
        };
    }
}