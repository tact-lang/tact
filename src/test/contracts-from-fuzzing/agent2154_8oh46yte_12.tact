struct S1 { a: Int; b: Bool; }
struct S2 { c: String; d: Int?; }
struct S3 { e: Bool; f: String?; }

contract ManyStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{a:1,b:true};
        self.s2 = S2{c:"hi",d:null};
        self.s3 = S3{e:false,f:"bye"};
    }
}