// deep nesting with many defaults inside structs
struct S3 {
    d: Int = 3;
}
struct S2 {
    c: S3 = S3{};
}
struct S1 {
    b: S2 = S2{};
}

contract DefaultsChain {
    a: S1;

    init() {
        self.a = S1{};
    }
}