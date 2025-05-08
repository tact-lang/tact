struct S1 {
    a: Int = 1;
}

struct S2 {
    b: Int = 2;
    s1: S1;
}

struct S3 {
    c: Int = 3;
    s2: S2;
}

struct S4 {
    d: Int = 4;
    s3: S3;
}

struct S5 {
    e: Int = 5;
    s4: S4;
}

contract FiveDeepNest {
    deepData: S5;

    init() {
        self.deepData = S5{
            e: 55,
            s4: S4{
                d: 44,
                s3: S3{
                    c: 33,
                    s2: S2{
                        b: 22,
                        s1: S1{a: 11}
                    }
                }
            }
        };
    }
}
