struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

struct S3 {
    c: Bool;
    s2: S2;
}

struct S4 {
    d: String;
    s3: S3;
}

contract TestContract {
    data: S4;

    init() {
        self.data = S4{
            d: "data",
            s3: S3{
                c: true,
                s2: S2{
                    b: 7,
                    s1: S1{
                        a: 3
                    }
                }
            }
        };
    }
}