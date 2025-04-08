struct A { val: Int; }
struct B { 
    nx: A?;
}
struct C {
    b: B;
    flag: Bool;
}

contract OptNestedStructs {
    c: C;

    init() {
        self.c = C{
            b: B{ nx: null },
            flag: false
        };
    }
}
