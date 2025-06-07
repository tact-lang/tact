struct S1 {
    s: String;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

struct S3 {
    val: S2;
    flag: Bool?;
}

contract ContractX {
    data: S3;

    init() {
        self.data = S3{
            val: S2{
                s1a: S1{s:"hi"},
                s1b: S1{s:"bye"},
            },
            flag: null,
        };
    }
}