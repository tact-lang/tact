struct S1 {
    a: Bool;
}

struct S2 {
    b: String;
}

struct S3 {
    c: Bool?;
}

contract MultiNested {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{a:true};
        self.f2 = S2{b:"foo"};
        self.f3 = S3{c:null};
    }
}