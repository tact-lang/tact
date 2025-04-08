struct S1 { val: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2?; }

contract Fuzz6 {
    field: S3;

    init() {
        self.field = S3{
            s2: null,
        };
    }
}