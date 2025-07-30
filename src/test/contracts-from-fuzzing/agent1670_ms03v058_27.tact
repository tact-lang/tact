struct S1 { a:Int; }
struct S2 { s:S1; }
struct S3 { s:S2; }
struct S4 { s:S3; }
struct S5 { s:S4; }
struct S6 { s:S5; }

contract TestDeeper6 {
    big:S6;
    init() {
        self.big = S6{s:S5{s:S4{s:S3{s:S2{s:S1{a:42}}}}}};
    }
}
