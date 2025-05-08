struct A {
    val: Int;
}

struct B {
    val: Int;
}

struct C {
    a: A;
    b: B;
}

contract ManyNested {
    field: C;
    
    init() {
        self.field = C{
            a: A{ val: 1 },
            b: B{ val: 2 }
        };
    }
}