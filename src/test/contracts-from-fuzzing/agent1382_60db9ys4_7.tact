struct A {
    a: Int;
    b: Bool;
}

struct B {
    c: A;
    d: A;
}

struct C {
    e: B;
    f: B;
}

contract WideNested {
    data: C;

    init() {
        self.data = C{
            e: B{ c: A{a:1,b:true}, d: A{a:2,b:false} },
            f: B{ c: A{a:3,b:true}, d: A{a:4,b:false} }
        };
    }
}
