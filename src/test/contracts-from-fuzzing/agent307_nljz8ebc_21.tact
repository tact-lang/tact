struct A {
    a: Int;
    b: Bool?;
}

struct B {
    a: Int;
    b: Bool?;
}

struct C {
    a: Int;
    b: Bool?;
}

contract MultiNested {
    s1: A;
    s2: B;
    s3: C;

    init() {
        self.s1 = A{a:1,b:true};
        self.s2 = B{a:2,b:null};
        self.s3 = C{a:3,b:false};
    }
}