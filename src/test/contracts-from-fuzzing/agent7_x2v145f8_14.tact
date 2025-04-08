struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    s2a: S2;
    s2b: S2;
}

struct S4 {
    s3a: S3;
    s3b: S3;
}

contract Test14 {
    top: S4;

    init() {
        self.top = S4{
            s3a: S3{
                s2a: S2{
                    s1a: S1{a:1,b:true},
                    s1b: S1{a:2,b:false},
                },
                s2b: S2{
                    s1a: S1{a:3,b:true},
                    s1b: S1{a:4,b:false},
                },
            },
            s3b: S3{
                s2a: S2{
                    s1a: S1{a:5,b:true},
                    s1b: S1{a:6,b:false},
                },
                s2b: S2{
                    s1a: S1{a:7,b:true},
                    s1b: S1{a:8,b:false},
                },
            }
        };
    }
}