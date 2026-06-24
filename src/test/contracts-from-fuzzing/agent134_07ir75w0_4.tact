struct S1 { f: Int }
struct S2 { f: Int }
struct S3 { f: Int }
struct S4 { f: Int }
struct S5 { f: Int }
struct S6 { f: Int }
struct S7 { f: Int }
struct S8 { f: Int }
struct S9 { f: Int }
struct S10 { f: Int }

contract WideStruct {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;
    s7: S7;
    s8: S8;
    s9: S9;
    s10: S10;

    init() {
        self.s1 = S1{f:1};
        self.s2 = S2{f:2};
        self.s3 = S3{f:3};
        self.s4 = S4{f:4};
        self.s5 = S5{f:5};
        self.s6 = S6{f:6};
        self.s7 = S7{f:7};
        self.s8 = S8{f:8};
        self.s9 = S9{f:9};
        self.s10 = S10{f:10};
    }
}
