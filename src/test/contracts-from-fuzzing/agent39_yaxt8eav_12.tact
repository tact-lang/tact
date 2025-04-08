struct S1 {
    f1: Int;
}
struct S2 {
    s: S1;
}
struct S3 {
    s: S2;
}
struct S4 {
    s: S3;
}
contract DeepChain {
    s: S4;

    init() {
        self.s = S4{
            s: S3{
                s: S2{
                    s: S1{ f1: 7 },
                },
            },
        };
    }
}