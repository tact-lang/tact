struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract DeepAssign {
    d: S3;

    init() {
        self.d = S3{
            s: S2{
                s: S1{a: 77}
            }
        };
    }
}