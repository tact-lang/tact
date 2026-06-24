struct S1 {
    x: Int;
}

struct S2 {
    opt: S1?;
}

struct S3 {
    deeper: S2?;
}

contract OptInOpt {
    data: S3? = null;

    init() {
        self.data = null;
    }
}