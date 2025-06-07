struct S1 {
    a: Int;
    b: String;
}
struct S2 {
    s1: S1;
    c: Bool;
}
struct S3 {
    s2: S2;
    d: String;
}

contract ChainNested {
    data: S3;
    init() {
        self.data = S3{
            s2: S2{
                s1: S1{
                    a: 1,
                    b: "b",
                },
                c: true,
            },
            d: "d",
        };
    }
}
