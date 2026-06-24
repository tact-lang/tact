// Deep chain of persistent nested optional references
struct S1 {
    s2: S2?;
    val: Int;
}

struct S2 {
    s3: S3?;
    val: Int;
}

struct S3 {
    val: Int;
}

contract TestContract {
    top: S1?;

    init() {
        self.top = null;
    }
}
