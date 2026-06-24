struct Deep {
    s1: S1;
}

struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    x: Int;
    y: Bool;
    z: String;
}

contract ContractDeep {
    d: Deep;

    init() {
        self.d = Deep{
            s1: S1{
                s2: S2{
                    s3: S3{x:1, y:true, z:"z"}
                }
            }
        };
    }
}
