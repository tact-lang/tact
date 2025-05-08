struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Int? }

contract ManyStructs {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.f1 = S1{a:1};
        self.f2 = S2{b:false};
        self.f3 = S3{c:"abc"};
        self.f4 = S4{d:null};
        self.a = 123;
        self.b = true;
        self.c = "xyz";
    }

    receive() {
        let _ = self.f1;
        let _ = self.f2;
        let _ = self.f3;
        let _ = self.f4;
    }
}
