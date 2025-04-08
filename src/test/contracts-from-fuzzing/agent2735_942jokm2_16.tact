struct S1 { v: Int; }
struct S2 { v: Bool; }
struct S3 { v: String; }

struct NestAll {
    s1: S1;
    s2: S2;
    s3: S3;
    comment: String;
}

contract NestedMix {
    f: NestAll;

    init() {
        self.f = NestAll{
            s1: S1{v:10},
            s2: S2{v:true},
            s3: S3{v:"x"},
            comment:"mixed",
        };
    }
}
