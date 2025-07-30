struct S1 {
    a: Int?;
}

struct S2 {
    s1: S1?;
}

struct S3 {
    s2: S2?;
}

struct S4 {
    s3: S3?;
}

contract DeepOptionals {
    s4: S4?;

    init() {
        self.s4 = null;
    }
}

contract R {
    receive() {
        let dummy: DeepOptionals? = null;
    }
}