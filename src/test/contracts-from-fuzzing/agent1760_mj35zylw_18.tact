struct S1 {
    s: String;
    b: Bool;
}

struct S2 {
    inner: S1;
    flag: Bool?;
}

struct S3 {
    nested: S2;
}

contract ChainStruct {
    chain: S3;

    init() {
        self.chain = S3{
            nested: S2{
                inner: S1{s: "test", b: true},
                flag: null
            }
        };
    }
}