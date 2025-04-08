struct S3 { val: Int? = null; }
struct S2 { s3: S3? = null; }
struct S1 { s2: S2? = null; }

contract TestContract {
    deep: S1? = null;
    init() {
        self.deep = S1{ s2: null };
    }
}