struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { s1: S1; s2: S2; }

contract Test24 {
    data: S3;

    init() {
        self.data = S3{
            s1: S1{a:42},
            s2: S2{b:false}
        };
    }
}