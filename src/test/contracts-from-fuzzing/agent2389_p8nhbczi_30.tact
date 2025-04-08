struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract RefReassign {
    field: C;
    
    init() {
        self.field = C{b:B{a:A{x:1,y:2}}};
        self.field = C{b:B{a:A{x:3,y:4}}};
    }
}