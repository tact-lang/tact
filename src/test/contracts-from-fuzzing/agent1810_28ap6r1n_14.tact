struct S1 { v: Int }
struct S2 { v: Bool }
struct S3 { v: String }

struct MultiNested {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract MixedTypesNested {
    data: MultiNested;
    init() {
        self.data = MultiNested{
            s1: S1{v:1},
            s2: S2{v:true},
            s3: S3{v:"hello"}
        };
    }
}