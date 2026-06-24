struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct S4 { d: Int?; }
struct S5 { e: Bool?; }
struct S6 { f: String?; }

contract ManySimpleStructRefs {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;
    f6: S6;

    init() {
        self.f1 = S1{a:1};
        self.f2 = S2{b:true};
        self.f3 = S3{c:"abc"};
        self.f4 = S4{d:null};
        self.f5 = S5{e:false};
        self.f6 = S6{f:null};
    }
}