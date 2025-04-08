struct S1 {
    val1: Int;
}

struct S2 {
    val2: Int;
    nested: S1;
}

struct S3 {
    val3: Int;
    nested: S2;
}

contract Chain {
    chainData: S3;

    init() {
        self.chainData = S3{
            val3: 3,
            nested: S2{
                val2: 2,
                nested: S1{
                    val1: 1,
                },
            },
        };
    }
}