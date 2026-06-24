struct S1 {
    x: Int = 1;
}

struct S2 {
    s1: S1;
    y: Bool = false;
}

struct S3 {
    s2: S2;
    z: String = "hi";
}

contract ChainStructs {
    chain: S3;

    init() {
        self.chain = S3{
            s2: S2{
                s1: S1{
                    x: 99
                },
                y: true
            },
            z: "bye"
        };
    }
}