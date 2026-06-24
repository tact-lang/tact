struct S1 { s: Int; }
struct S2 { p: S1; }
struct S3 { p: S2; }
struct S4 { p: S3; }
struct S5 { p: S4; }
struct S6 { p: S5; }
struct S7 { p: S6; }
struct S8 { p: S7; }
struct S9 { p: S8; }
struct S10 { p: S9; }

contract DeepTen {
    f: S10 = S10{p: S9{p: S8{p: S7{p: S6{p: S5{p: S4{p: S3{p: S2{p: S1{s:123}}}}}}}}}};
}