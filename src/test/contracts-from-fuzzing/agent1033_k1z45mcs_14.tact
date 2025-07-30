struct S1 {
    f1: Int;
}
struct S2 {
    f2: Int;
    s1: S1;
}
struct S3 {
    f3: Int;
    s2: S2;
}
struct S4 {
    f4: Int;
    s3: S3;
}
contract BigNesting {
    val: S4;

    init() {
        self.val = S4{
            f4: 4,
            s3: S3{
                f3: 3,
                s2: S2{
                    f2: 2,
                    s1: S1{ f1: 1 }
                }
            }
        };
    }
}