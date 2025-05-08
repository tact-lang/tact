struct S1 {
    f: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract OptDeep {
    data: S3?;
    init() {
        self.data = null;
    }
}