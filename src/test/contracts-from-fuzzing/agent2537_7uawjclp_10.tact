struct S1 {
    val1: Int;
}

struct S2 {
    s1: S1;
    val2: Int;
}

struct S3 {
    s2: S2;
    val3: Int;
}

struct S4 {
    s3: S3;
    val4: Int;
}

contract ComplexNest {
    storage: S4;
    init() {
        self.storage = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ val1: 1 },
                    val2: 2
                },
                val3: 3
            },
            val4: 4
        };
    }
}