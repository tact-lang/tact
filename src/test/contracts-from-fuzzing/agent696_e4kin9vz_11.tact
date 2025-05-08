struct S1 { x: Int }
struct S2 { a: Int; s1: S1 }
struct S3 { b: Int; s2: S2 }

contract NestedChain {
    val: S3;

    init() {
        self.val = S3 { b:1, s2: S2{a:2,s1:S1{x:3}} };
    }
}
