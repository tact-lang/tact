struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }

struct HighNest {
    s1: S1;
    s2: S2;
    s3: S3;
}

struct OuterMost {
    nest: HighNest;
}

contract MultiLayer {
    o: OuterMost;
    init() {
        self.o = OuterMost{
            nest: HighNest{
                s1: S1{a:1},
                s2: S2{b:true},
                s3: S3{c:"yo"}
            }
        };
    }
}