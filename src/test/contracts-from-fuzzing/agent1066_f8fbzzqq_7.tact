struct S1 {
    x1: Int;
}
struct S2 {
    x2: S1;
}
struct S3 {
    x3: S2;
}
struct S4 {
    x4: S3;
}
struct S5 {
    x5: S4;
}
struct S6 {
    x6: S5;
}

contract DeepChain {
    nested: S6;

    init() {
        self.nested = S6{x6: S5{x5: S4{x4: S3{x3: S2{x2: S1{x1: 99}}}}}};
    }
}