struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Int? }

contract ManySmallStructs {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;

    init() {
        self.s1 = S1{a:1};
        self.s2 = S2{b:true};
        self.s3 = S3{c:"x"};
        self.s4 = S4{d:null};
    }

    receive() {
        let a = self.s1;
        let b = self.s2;
        let c = self.s3;
        let d = self.s4;
    }
}