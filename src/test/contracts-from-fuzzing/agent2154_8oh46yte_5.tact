struct A {
    x: Int;
    y: Int;
}

struct B {
    a1: A;
    a2: A;
}

struct C {
    b1: B;
    b2: B;
}

contract DeepNest {
    val: C;
    
    init() {
        self.val = C{
            b1: B{ a1: A{x:1,y:2}, a2: A{x:3,y:4} },
            b2: B{ a1: A{x:5,y:6}, a2: A{x:7,y:8} }
        };
    }
}