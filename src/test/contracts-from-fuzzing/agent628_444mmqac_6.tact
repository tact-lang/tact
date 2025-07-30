struct S1 { a: Int }
struct S2 { b: String }
struct S3 { c: Bool }
struct S4 { d: Int }

struct SuperNested {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
}

contract FourDeep {
    val: SuperNested;

    init() {
        self.val = SuperNested{
            s1: S1{a:1},
            s2: S2{b:"hi"},
            s3: S3{c:true},
            s4: S4{d:9}
        };
    }
}