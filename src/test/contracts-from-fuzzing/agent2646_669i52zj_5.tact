struct S1 { v1: Int; }
struct S2 { v2: Bool; }
struct S3 { v3: String; }
struct S4 { v4: Int; }
struct S5 { v5: Bool; }
struct S6 { v6: String; }
struct S7 { v7: Int; }
struct S8 { v8: Bool; }
struct S9 { v9: String; }
struct S10 { v10: Int; }

contract ManyFields {
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
        self.s1 = S1{v1: 1};
        self.s2 = S2{v2: true};
        self.s3 = S3{v3: "3"};
        self.s4 = S4{v4: 4};
        self.s5 = S5{v5: false};
        self.s6 = S6{v6: "6"};
        self.s7 = S7{v7: 7};
        self.s8 = S8{v8: true};
        self.s9 = S9{v9: "9"};
        self.s10 = S10{v10: 10};
    }
    receive() {}
}