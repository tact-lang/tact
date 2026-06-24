struct S1 {
    s2: S2?;
}

struct S2 {
    s3: S3?;
}

struct S3 {
    s4: S4?;
}

struct S4 {
    num: Int;
}

contract OptChain {
    val: S1;

    init() {
        self.val = S1 {
            s2: null
        };
    }
}