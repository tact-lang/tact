struct S1 { a: Int; }
struct S2 { a: S1; }
struct S3 { a: S2; }
struct S4 { a: S3; }
struct S5 { a: S4; }
struct S6 { a: S5; }
struct S7 { a: S6; }
struct S8 { a: S7; }
struct S9 { a: S8; }
struct S10 { a: S9; }

contract VeryDeepNest {
    val: S10;

    init() {
        self.val = S10{a:S9{a:S8{a:S7{a:S6{a:S5{a:S4{a:S3{a:S2{a:S1{a:1}}}}}}}}}};
    }
}