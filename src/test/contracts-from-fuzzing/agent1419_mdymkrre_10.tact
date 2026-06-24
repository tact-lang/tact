struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Int? }
struct S5 { e: Bool? }
struct S6 { f: String? }
struct S7 { g: Int }
struct S8 { h: Bool }
struct S9 { i: String }
struct S10 { j: Int? }

contract WideFields {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;
    f6: S6;
    f7: S7;
    f8: S8;
    f9: S9;
    f10: S10;

    init() {
        self.f1 = S1{a: 1};
        self.f2 = S2{b: true};
        self.f3 = S3{c: "x"};
        self.f4 = S4{d: null};
        self.f5 = S5{e: false};
        self.f6 = S6{f: null};
        self.f7 = S7{g: 7};
        self.f8 = S8{h: false};
        self.f9 = S9{i: "y"};
        self.f10 = S10{j: 10};
    }
}