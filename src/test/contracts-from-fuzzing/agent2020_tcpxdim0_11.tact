struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: S1;
    y: Int;
}

struct S3 {
    s: S2;
    t: S1;
}

contract MultiStructNesting {
    p1: S3;

    init() {
        self.p1 = S3{
            s: S2{
                x: S1{a:1, b:true},
                y: 42,
            },
            t: S1{a:7, b:false},
        };
    }
}
