struct S0 {
    a: Int;
}
struct S1 {
    p: S0;
}
struct S2 {
    p: S1;
}
struct S3 {
    p: S2;
}
struct S4 {
    p: S3;
}
struct S5 {
    p: S4;
}

contract DeepContract {
    field: S5;
    init() {
       self.field = S5{p: S4{p: S3{p: S2{p: S1{p:S0{a:1}}}}}};
    }
}
