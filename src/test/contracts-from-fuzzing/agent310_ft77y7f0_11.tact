struct DeepNested {
    s1: S1?;
    s2: S2?;
    s3: S3?;
}

struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }

contract TestContract {
    val: DeepNested?;

    init() {
        self.val = null;
    }
}
