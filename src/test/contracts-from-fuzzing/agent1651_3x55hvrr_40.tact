struct S1Opt {
    s: S2Opt?;
}

struct S2Opt {
    s: S3Opt?;
}

struct S3Opt {
    x: Int?;
}

contract Test40 {
    val: S1Opt;

    init() {
        self.val = S1Opt{ s:null };
    }
}
