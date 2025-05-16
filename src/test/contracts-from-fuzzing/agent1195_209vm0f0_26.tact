struct Sub1 { a: Int; b: Bool; }
struct Sub2 { a: Int; b: Bool; }
struct Sub3 { a: Int; b: Bool; }

contract ManySubs {
    s1: Sub1;
    s2: Sub2;
    s3: Sub3;

    init() {
        self.s1 = Sub1{a:1, b:true};
        self.s2 = Sub2{a:2, b:false};
        self.s3 = Sub3{a:3, b:true};
    }
}
