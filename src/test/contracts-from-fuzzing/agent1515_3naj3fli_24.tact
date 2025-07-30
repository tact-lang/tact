struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract WithThreeLayersOptional {
    s3opt: S3?;

    init() {
        self.s3opt = null;
    }
}