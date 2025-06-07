struct S1 { a: Int; }
struct S2 { s: S1; }
struct S3 { s: S2; }

contract ThreeLayerNested {
    val: S3;
    init() {
        self.val = S3{ s: S2{ s: S1{a:42} } };
    }
}