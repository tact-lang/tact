struct S1 {
    foo: Int?;
}

struct S2 {
    bar: S1?;
}

struct S3 {
    baz: S2?;
}

contract TripleLiftedOpt {
    val: S3?;

    init() {
        self.val = null;
    }
}