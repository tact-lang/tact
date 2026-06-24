struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Bool;
}

struct S3 {
    s2: S2;
    msg: String;
    opt_s2: S2?;
}

contract StructChain {
    chain: S3;

    init() {
        self.chain = S3{
            s2: S2{
                s1: S1{a:1},
                b: true,
            },
            msg: "msg",
            opt_s2: null,
        };
    }
}