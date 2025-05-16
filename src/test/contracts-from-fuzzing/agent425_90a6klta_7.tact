struct S1 {
    a: Int;
    b: Bool;
    c: Int?;
}

struct S2 {
    d: S1;
    e: Int;
    f: Bool?;
}

struct S3 {
    g: S2;
    h: Int;
}

contract C1 {
    f: S3;

    init() {
        self.f = S3{
            g: S2{
                d: S1{ a:1, b:true, c:null },
                e:42,
                f:false
            },
            h:99
        };
    }
}