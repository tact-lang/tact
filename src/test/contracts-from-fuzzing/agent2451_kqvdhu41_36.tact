struct S1 {
    f1: Int;
    f2: String;
}

struct S2 {
    nested: S1;
    note: String;
}

struct S3 {
    inner: S2;
}

contract NestedS3 {
    val: S3;

    init() {
        self.val = S3{
            inner: S2{
                nested: S1{ f1:42, f2:"yo" },
                note: "note"
            }
        };
    }
}