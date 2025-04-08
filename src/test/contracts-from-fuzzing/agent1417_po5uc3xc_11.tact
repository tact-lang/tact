struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    inner: S1;
}

struct S3 {
    c: Int;
    d: Bool;
    s2: S2;
}

contract ChainNested {
    state: S3;
    init() {
        self.state = S3{
            c:3,
            d:true,
            s2: S2{
                b:2,
                inner: S1{a:1}
            }
        };
    }
}