struct S1 {
    i: Int;
}

struct S2 {
    i: Int;
    s1: S1;
}

struct S3 {
    s2: S2;
    flag: Bool;
}

struct S4 {
    s3: S3;
    txt: String;
}

contract DeeplyChained {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                s2: S2{
                    i: 5,
                    s1: S1{
                        i: 9
                    }
                },
                flag: false
            },
            txt: "abc"
        };
    }
}