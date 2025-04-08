struct S1 { a: Int?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }

contract NestedDeepOptionals {
    val: S3;
    init() {
        self.val = S3 { s2: S2 { s1: S1 { a: null } } };
    }
}
