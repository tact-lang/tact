struct S1 {
    a: Int;
}
struct S2 {
    a: Int;
    b: S1;
}
struct S3 {
    a: Int;
    b: S2;
}
struct S4 {
    a: Int;
    b: S3;
}

contract WideDeep {
    f: S4;

    init() {
        self.f = S4{
            a: 1,
            b: S3{
                a: 2,
                b: S2{
                    a: 3,
                    b: S1{ a: 4 }
                }
            }
        };
    }
}