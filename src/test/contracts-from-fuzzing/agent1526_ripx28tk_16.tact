struct S0 { v: Int; }
struct S1 { v: S0; }
struct S2 { v: S1; }
struct S3 { v: S2; }
struct S4 { v: S3; }
struct S5 { v: S4; }
struct S6 { v: S5; }
struct S7 { v: S6; }

contract VeryDeepNested {
    d: S7;

    init() {
        self.d = S7{v:S6{v:S5{v:S4{v:S3{v:S2{v:S1{v:S0{v:1}}}}}}}};
    }
}