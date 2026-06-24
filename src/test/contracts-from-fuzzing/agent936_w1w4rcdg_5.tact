struct S1 {
    v1: Int;
    v2: Bool;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2a: S2;
    s2b: S2;
}

contract WideDeep {
    big: S3;

    init() {
        self.big = S3{
            s2a: S2{ s1a: S1{v1:1,v2:true}, s1b: S1{v1:2,v2:false} },
            s2b: S2{ s1a: S1{v1:3,v2:true}, s1b: S1{v1:4,v2:false} }
        };
    }

    receive() {
        let _ = self.big.s2b.s1b.v2;
    }
}