struct Sub1 { f1: Int; f2: Bool; }
struct Sub2 { f3: String; f4: Int; }
struct Sub3 { f5: Bool; f6: String; }

struct Top {
    s1: Sub1;
    s2: Sub2;
    s3: Sub3;
}

contract StructFusion {
    data: Top;

    init() {
        self.data = Top {
            s1: Sub1{ f1:3, f2:false },
            s2: Sub2{ f3:"hey", f4:10 },
            s3: Sub3{ f5:true, f6:"ok" }
        };
    }
}
