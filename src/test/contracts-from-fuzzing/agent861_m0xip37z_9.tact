struct S1 {
    val: Int;
}

struct S2 {
    nested: S1;
}

struct S3 {
    nested: S2;
}

contract OptDeepNested {
    data: S3?;

    init() {
        self.data = null;
    }
}
