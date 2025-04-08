struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract OptDeepStruct {
    stuff: S3?;

    init() {
        self.stuff = null;
    }
}