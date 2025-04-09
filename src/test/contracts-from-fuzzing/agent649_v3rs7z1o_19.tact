struct IntOnly { a: Int; b: Int; c: Int; }

contract IntSequence {
    f1: IntOnly;
    f2: IntOnly;
    f3: IntOnly;
    f4: IntOnly;
    f5: IntOnly;

    init() {
        self.f1 = IntOnly{ a:1,b:2,c:3 };
        self.f2 = IntOnly{ a:4,b:5,c:6 };
        self.f3 = IntOnly{ a:7,b:8,c:9 };
        self.f4 = IntOnly{ a:10,b:11,c:12 };
        self.f5 = IntOnly{ a:13,b:14,c:15 };
    }
}