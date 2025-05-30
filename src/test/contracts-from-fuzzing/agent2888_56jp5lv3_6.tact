struct S1 {
    a: Int;
}
struct S2 {
    s1_ref: S1;
}
struct S3 {
    s2_ref: S2;
}
contract VeryDeep {
    inner: S3;

    init() {
        self.inner = S3{
            s2_ref: S2{
                s1_ref: S1{
                    a: 999,
                },
            },
        };
    }
}