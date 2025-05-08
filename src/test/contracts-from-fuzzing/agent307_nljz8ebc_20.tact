struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Int? }
struct S5 { e: Bool? }
struct S6 { f: String? }

contract MultiStruct {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;

    init() {
        self.s1 = S1{a:1};
        self.s2 = S2{b:false};
        self.s3 = S3{c:"abc"};
        self.s4 = S4{d:null};
        self.s5 = S5{e:true};
        self.s6 = S6{f:null};
    }
}