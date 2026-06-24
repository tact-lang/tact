struct S1 { s: String }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
contract StringNest3 {
    val: S3;
    init() {
        self.val = S3{s2: S2{s1: S1{s:"nested"}}};
    }
}