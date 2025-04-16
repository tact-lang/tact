struct A {
    f1: Int;
}

struct B {
    f2: Int;
}

struct C {
    sa: A;
    sb: B;
}

contract WithNestedStructs {
    nested: C;
    
    init() {
        self.nested = C{
            sa: A{ f1: 1 },
            sb: B{ f2: 2 },
        };
    }
}
