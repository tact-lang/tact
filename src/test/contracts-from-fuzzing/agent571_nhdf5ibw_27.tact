struct S3 { val: Int; }

struct S2 { s3: S3?; }

struct S1 { s2: S2?; }

contract TestContract {
    data: S1?;

    init() {
        self.data = null;
    }
}