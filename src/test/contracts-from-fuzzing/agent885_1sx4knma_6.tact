struct S1 { f: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }

contract TestContract {
    opt: S4?;

    init() {
        self.opt = null;
    }
}