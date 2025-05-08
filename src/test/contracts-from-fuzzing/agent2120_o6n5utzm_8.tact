struct S1 {
    a: Int;
}
struct S2 {
    b: Int;
    c: S1;
}
struct S3 {
    d: Int;
    e: S2;
}
struct S4 {
    f: Int;
    g: S3;
}
contract DeepChain {
    chain: S4;
    init() {
        self.chain = S4{ f:0, g: S3{ d:1, e: S2{ b:2, c: S1{ a:3 } } } };
    }
}