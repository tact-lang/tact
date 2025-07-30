struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    b: Bool;
}

struct S3 {
    s2: S2;
    a: Address;
}

contract Test {
    val: S3;

    init() {
        self.val = S3{
            s2: S2{
                s1: S1{
                    x: 99,
                },
                b: true,
            },
            a: myAddress(),
        };
    }
}