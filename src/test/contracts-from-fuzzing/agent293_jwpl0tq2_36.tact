struct S1 {
    f: Int;
}

struct S2 {
    s: S1?;
}

struct S3 {
    s: S2?;
}

struct S4 {
    s: S3?;
}

contract MultiWrappedOpt {
    val: S4;

    init() {
        self.val = S4{s: null};
    }
}