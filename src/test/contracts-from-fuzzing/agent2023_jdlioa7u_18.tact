struct HugeNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Sub1;
    h: Sub2;
}
struct Sub1 {
    s1: Int;
    s2: String;
    s3: Bool?;
}
struct Sub2 {
    t1: String?;
    t2: Bool;
    t3: Sub3;
}
struct Sub3 {
    u1: Int;
    u2: String?;
}

contract TestContract {
    bigNested: HugeNested;

    init() {
        self.bigNested = HugeNested{
            a:1, b:"x", c:true, d:null, e:"zzz", f:false,
            g: Sub1{ s1:5, s2:"q", s3:true },
            h: Sub2{ t1:null, t2:true, t3: Sub3{ u1:10, u2:null } }
        };
    }

    receive() { let u = self.bigNested.h.t3.u1; }
}