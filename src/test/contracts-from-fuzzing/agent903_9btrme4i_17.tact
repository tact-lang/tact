struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2: S2;
}

contract MultiNested {
    storage: S3;

    init() {
        self.storage = S3{
            s2: S2{
                s1a: S1{a:1, b:true},
                s1b: S1{a:2, b:false}
            }
        };
    }
}