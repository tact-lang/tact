struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Bool;
}

struct S3 {
    s2: S2;
    c: String;
}

contract DeepChain {
    val: S3;

    init() {
        self.val = S3{
            s2: S2{
                s1: S1{a:123},
                b:true,
            },
            c:"chain",
        };
    }
}