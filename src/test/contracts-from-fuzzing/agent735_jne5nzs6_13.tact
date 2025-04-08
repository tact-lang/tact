struct S3 {
    x: Int as int8;
    y: Int? as uint4;
}

struct S2 {
    s3: S3;
    flag: Bool;
}

struct S1 {
    num: Int as uint32;
    optFlag: Bool?;
    inner: S2;
}

contract DeepSerializeVariants {
    state: S1;

    init() {
        self.state = S1{
            num: 0x1001,
            optFlag: null,
            inner: S2{
                s3: S3{
                    x: -64,
                    y: 8,
                },
                flag: true,
            },
        };
    }
}
