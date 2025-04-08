struct S1 {
    val: Int = 1;
}

struct S2 {
    svar: S1 = S1{};
}

struct S3 {
    val: S2;
}

contract NestedDefaultStructs {
    s3: S3;

    init() {
        self.s3 = S3{
            val: S2{},
        };
    }
}