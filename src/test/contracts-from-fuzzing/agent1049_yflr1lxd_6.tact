struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
}

contract ArrangedWithDefaults {
    f1: S = S{ a:1, b:true, c:"a", d:null, e:null };
    f2: S = S{ a:2, b:false, c:"b", d:5, e:null };

    init() {
        self.f1 = S{ a:11, b:false, c:"X", d:null, e:"hi"};
        self.f2 = S{ a:22, b:true, c:"Y", d:123, e:null};
    }
}