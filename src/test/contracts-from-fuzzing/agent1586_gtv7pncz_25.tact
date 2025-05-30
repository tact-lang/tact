struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    num: Int;
}

contract ChainStruct {
    s: S1;

    init() {
        self.s = S1 {
            s2: S2 {
                s3: S3 {
                    num: 99
                }
            }
        };
    }
}