struct S4 { d: Int = 4; }
struct S3 { c: S4; }
struct S2 { b: S3; }
struct S1 { a: S2; }

contract ChainOpt {
    data: S1?;

    init() {
        self.data = null;
    }
}