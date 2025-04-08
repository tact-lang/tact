struct S1 {
    s: String;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract StringNest {
    field: S3;

    init() {
        self.field = S3{
            s: S2{
                s: S1{ s: "deepstring" }
            }
        };
    }
}
