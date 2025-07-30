struct S1 { i: Int; }
struct S2 { b: Bool; }
struct S3 { s: String; }

contract Combo {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{i:1};
        self.f2 = S2{b:true};
        self.f3 = S3{s:"hi"};
    }
}