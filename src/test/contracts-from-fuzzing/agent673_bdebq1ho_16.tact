struct S1 { f1: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }

contract NestedStructChain {
    val: S3;

    init() {
        self.val = S3{ s: S2{ s: S1{ f1: 42 } } };
    }
}